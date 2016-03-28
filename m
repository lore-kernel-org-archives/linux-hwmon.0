Return-path: <Ray.Huang@amd.com>
From: Huang Rui <ray.huang@amd.com>
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.de>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<spg_linux_kernel@amd.com>, Borislav Petkov <bp@alien8.de>, Huang Rui
	<ray.huang@amd.com>
Subject: [PATCH v5 4/6] hwmon: (fam15h_power) Introduce a cpu accumulated power reporting algorithm
Date: Mon, 28 Mar 2016 13:32:14 +0800
Message-ID: <1459143136-2412-5-git-send-email-ray.huang@amd.com>
In-Reply-To: <1459143136-2412-1-git-send-email-ray.huang@amd.com>
References: <1459143136-2412-1-git-send-email-ray.huang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-ID: <linux-hwmon@vger.kernel.org>

This patch introduces an algorithm that computes the average power by
reading a delta value of =E2=80=9Ccore power accumulator=E2=80=9D registe=
r during
measurement interval, and then dividing delta value by the length of
the time interval.

User is able to use power1_average entry to measure the processor power
consumption and power1_average_interval entry to set the interval.

A simple example:

ray@hr-ub:~/tip$ sensors
fam15h_power-pci-00c4
Adapter: PCI adapter
power1:       19.58 mW (avg =3D   2.55 mW, interval =3D   0.01 s)
                       (crit =3D  15.00 W)

...

The result is current average processor power consumption in 10
millisecond. The unit of the result is uWatt.

Suggested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Huang Rui <ray.huang@amd.com>
Cc: Borislav Petkov <bp@alien8.de>
---
 drivers/hwmon/fam15h_power.c | 119 +++++++++++++++++++++++++++++++++++++=
++++++
 1 file changed, 119 insertions(+)

diff --git a/drivers/hwmon/fam15h_power.c b/drivers/hwmon/fam15h_power.c
index de6f52b..003564b 100644
--- a/drivers/hwmon/fam15h_power.c
+++ b/drivers/hwmon/fam15h_power.c
@@ -27,6 +27,8 @@
 #include <linux/bitops.h>
 #include <linux/cpu.h>
 #include <linux/cpumask.h>
+#include <linux/time.h>
+#include <linux/sched.h>
 #include <asm/processor.h>
 #include <asm/msr.h>
=20
@@ -48,6 +50,9 @@ MODULE_LICENSE("GPL");
 #define FAM15H_NUM_GROUPS		2
 #define MAX_CUS				8
=20
+/* set maximum interval as 1 second */
+#define MAX_INTERVAL			1000
+
 #define MSR_F15H_CU_PWR_ACCUMULATOR	0xc001007a
 #define MSR_F15H_CU_MAX_PWR_ACCUMULATOR	0xc001007b
 #define MSR_F15H_PTSC			0xc0010280
@@ -68,6 +73,9 @@ struct fam15h_power_data {
 	u64 cu_acc_power[MAX_CUS];
 	/* performance timestamp counter */
 	u64 cpu_sw_pwr_ptsc[MAX_CUS];
+	/* online/offline status of current compute unit */
+	int cu_on[MAX_CUS];
+	unsigned long power_period;
 };
=20
 static ssize_t show_power(struct device *dev,
@@ -149,6 +157,8 @@ static void do_read_registers_on_cu(void *_data)
=20
 	rdmsrl_safe(MSR_F15H_CU_PWR_ACCUMULATOR, &data->cu_acc_power[cu]);
 	rdmsrl_safe(MSR_F15H_PTSC, &data->cpu_sw_pwr_ptsc[cu]);
+
+	data->cu_on[cu] =3D 1;
 }
=20
 /*
@@ -165,6 +175,8 @@ static int read_registers(struct fam15h_power_data *d=
ata)
 	if (!ret)
 		return -ENOMEM;
=20
+	memset(data->cu_on, 0, sizeof(int) * MAX_CUS);
+
 	get_online_cpus();
 	this_cpu =3D get_cpu();
=20
@@ -192,18 +204,117 @@ static int read_registers(struct fam15h_power_data=
 *data)
 	return 0;
 }
=20
+static ssize_t acc_show_power(struct device *dev,
+			      struct device_attribute *attr,
+			      char *buf)
+{
+	struct fam15h_power_data *data =3D dev_get_drvdata(dev);
+	u64 prev_cu_acc_power[MAX_CUS], prev_ptsc[MAX_CUS],
+	    jdelta[MAX_CUS];
+	u64 tdelta, avg_acc;
+	int cu, cu_num, ret;
+	signed long leftover;
+
+	/*
+	 * With the new x86 topology modelling, x86_max_cores is the
+	 * compute unit number.
+	 */
+	cu_num =3D boot_cpu_data.x86_max_cores;
+
+	ret =3D read_registers(data);
+	if (ret)
+		return 0;
+
+	for (cu =3D 0; cu < cu_num; cu++) {
+		prev_cu_acc_power[cu] =3D data->cu_acc_power[cu];
+		prev_ptsc[cu] =3D data->cpu_sw_pwr_ptsc[cu];
+	}
+
+	leftover =3D schedule_timeout_interruptible(msecs_to_jiffies(data->powe=
r_period));
+	if (leftover)
+		return 0;
+
+	ret =3D read_registers(data);
+	if (ret)
+		return 0;
+
+	for (cu =3D 0, avg_acc =3D 0; cu < cu_num; cu++) {
+		/* check if current compute unit is online */
+		if (data->cu_on[cu] =3D=3D 0)
+			continue;
+
+		if (data->cu_acc_power[cu] < prev_cu_acc_power[cu]) {
+			jdelta[cu] =3D data->max_cu_acc_power + data->cu_acc_power[cu];
+			jdelta[cu] -=3D prev_cu_acc_power[cu];
+		} else {
+			jdelta[cu] =3D data->cu_acc_power[cu] - prev_cu_acc_power[cu];
+		}
+		tdelta =3D data->cpu_sw_pwr_ptsc[cu] - prev_ptsc[cu];
+		jdelta[cu] *=3D data->cpu_pwr_sample_ratio * 1000;
+		do_div(jdelta[cu], tdelta);
+
+		/* the unit is microWatt */
+		avg_acc +=3D jdelta[cu];
+	}
+
+	return sprintf(buf, "%llu\n", (unsigned long long)avg_acc);
+}
+static DEVICE_ATTR(power1_average, S_IRUGO, acc_show_power, NULL);
+
+static ssize_t acc_show_power_period(struct device *dev,
+				     struct device_attribute *attr,
+				     char *buf)
+{
+	struct fam15h_power_data *data =3D dev_get_drvdata(dev);
+
+	return sprintf(buf, "%lu\n", data->power_period);
+}
+
+static ssize_t acc_set_power_period(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t count)
+{
+	struct fam15h_power_data *data =3D dev_get_drvdata(dev);
+	unsigned long temp;
+	int ret;
+
+	ret =3D kstrtoul(buf, 10, &temp);
+	if (ret)
+		return ret;
+
+	if (temp > MAX_INTERVAL)
+		return -EINVAL;
+
+	/* the interval value should be greater than 0 */
+	if (temp <=3D 0)
+		return -EINVAL;
+
+	data->power_period =3D temp;
+
+	return count;
+}
+static DEVICE_ATTR(power1_average_interval, S_IRUGO | S_IWUSR,
+		   acc_show_power_period, acc_set_power_period);
+
 static int fam15h_power_init_attrs(struct pci_dev *pdev,
 				   struct fam15h_power_data *data)
 {
 	int n =3D FAM15H_MIN_NUM_ATTRS;
 	struct attribute **fam15h_power_attrs;
 	struct cpuinfo_x86 *c =3D &boot_cpu_data;
+	u32 cpuid;
=20
 	if (c->x86 =3D=3D 0x15 &&
 	    (c->x86_model <=3D 0xf ||
 	     (c->x86_model >=3D 0x60 && c->x86_model <=3D 0x7f)))
 		n +=3D 1;
=20
+	cpuid =3D cpuid_edx(0x80000007);
+
+	/* check if processor supports accumulated power */
+	if (cpuid & BIT(12))
+		n +=3D 2;
+
 	fam15h_power_attrs =3D devm_kcalloc(&pdev->dev, n,
 					  sizeof(*fam15h_power_attrs),
 					  GFP_KERNEL);
@@ -218,6 +329,11 @@ static int fam15h_power_init_attrs(struct pci_dev *p=
dev,
 	     (c->x86_model >=3D 0x60 && c->x86_model <=3D 0x7f)))
 		fam15h_power_attrs[n++] =3D &dev_attr_power1_input.attr;
=20
+	if (cpuid & BIT(12)) {
+		fam15h_power_attrs[n++] =3D &dev_attr_power1_average.attr;
+		fam15h_power_attrs[n++] =3D &dev_attr_power1_average_interval.attr;
+	}
+
 	data->group.attrs =3D fam15h_power_attrs;
=20
 	return 0;
@@ -330,6 +446,9 @@ static int fam15h_power_init_data(struct pci_dev *f4,
=20
 	data->max_cu_acc_power =3D tmp;
=20
+	/* set default interval as 10 ms */
+	data->power_period =3D 10;
+
 	return read_registers(data);
 }
=20
--=20
1.9.1
