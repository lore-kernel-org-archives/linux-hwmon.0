Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 669F7C43214
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 20:52:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E1A160FD7
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 20:52:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231126AbhG1Uw0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 28 Jul 2021 16:52:26 -0400
Received: from mout.gmx.net ([212.227.17.20]:45879 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231764AbhG1UwN (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Jul 2021 16:52:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1627505515;
        bh=oixciV1xo5MoHy9eeElEMgU+g7Dm3FkM0+yVGfMkbB4=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Zs6DFydTsrVihixivbqMGjjmRN6vGnykO6VsCkGigllFxTowNHyW/tK63co3YGfoS
         CatvvPFa9dXzoGAl1gi8S2jlDGQMaRAS9I0LIDQ/qeYj5UcFuVc8IdKEShVxTFnAK0
         QikMLJ6AJuSe5I7PXJBu01w3M1IrwCxiBKrLe+KI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([79.242.190.212]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MYeR1-1mdtlp2mBP-00VeF9; Wed, 28 Jul 2021 22:51:54 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v6 4/6] hwmon: (dell-smm-hwmon) Move variables into a driver private data structure
Date:   Wed, 28 Jul 2021 22:51:40 +0200
Message-Id: <20210728205142.8959-5-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210728205142.8959-1-W_Armin@gmx.de>
References: <20210728205142.8959-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YEkPi1fcfwoKscgNEro/reIdw1qZltPG6e40P0k478aiux10pXm
 iMUhJEyL5CqebhsMDmwEofJyZwdIMbJfRt63FGO4jFh8Q0vK4AFRNdI1eyondSM8EPNMbLd
 alcBZiLQCoLyciy1Gkuayn9g4EUoXs0+qHZUzL0IJIEiycmGNnaEEP2XPRVEIafipbelPO0
 +QniwKUNnPNyzv7nye/hA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ipUO/xDdv28=:GzjoJbcnRSN3zfcMXNZ+NI
 PveYWtuMxNK/BOG2Xf7gBLDu6Fl67/Oirt/Ift6kwh+iLI4DCg7mFJJ2LX96REaMpya9izl5I
 fWNr9JqkKBLDHmQc5lRgzd252QUUXZJHzHui7CaL/PWLUO1Z5JA1xqUOKBKbCbC8jrdOojEEW
 ntJ4MVSvAFttHJOjTlA7IKrf4nu0Ms6s9Zkzb2vF4gAIOra7e4NsAhBTFA5orz4lBceq/vz0a
 pb5olgU1E+1Th+0MVTAhY2VaamLd8zXjIwsudbqtnw9l6LZF60d00ImlunngBkhRxFiloQ8f3
 6DCsgr0ciXVNoOhdqQVmFDRegdr2iqKU8F6/XxU9IBVdSNSBBsBjbBVQM+6WI8fz1py5jPw/+
 ZdJS3w4gIgp28OYMgsK7GUgd3klLNmLAjwl7fGrIMt4AX8BESyuoB7+8PAY9O8xd+MJU341a5
 P4vEbupsSp2NIgzJ/sOFV2Z8VqIVF8RsMv0iY+vwCIX+EOrG7BouN3d1Pr2MSuHuWL2tvW5xG
 m2ATnoqUZhcn9GOdZ6yzxJhN6fd0iDwnGmo7azyXq2wEiQ0AJl6rW+u+QpkEoUPwZlz4vWGjT
 rCgUnno/lBNV9d4/EhlviunnZBOA88tF9sHN6VddSToLExMTgU3m5jN2qIHD07PwyRTFTERK3
 K/hd7Ibei7dOfr+0tKGPVsyktFYHutrrpb3jSjZ0HWLcLYR7DHd4n3OL19xols/F3Z6KqQSML
 O4UgzX0O23f6E5CLrunZGjk4SwooxUZChcub9v+3q3MVpoqHIGiIyYWcg99tCN4eGDvJIbq7h
 f9HjtMG2MALMSvQBItATt3M3LHbx0RsR/L/VQqWsh0kbk2nzRK667sH/ll6u+aISD/OnZlbfC
 rSb895ltwcqNJ3IRRZYMjx3D1kC5muvTsOviGUJc7w97I1EBXVEj5uZZdshK7roCx4RAAwhlJ
 MuTwo4XzphLe/aYUmeu+pM5xpO2unwNB3xCDNHdUeDgmB2GzAqddc1WwC4DXzsLigrlnnDZMl
 3I08H8sAKf/vOujlzNXAmJyGRgod5G9Q9bZY+118iRKZ9mUgHyuymIwhogL/UGzTcZ71y1sVb
 9nnJoGO0fl6P50iUCyK0E81Ylhtg5lqMblT
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Move Variables into a driver private data structure.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 277 ++++++++++++++++++---------------
 1 file changed, 152 insertions(+), 125 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index da7040f2442e..8841fc1e5872 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -60,18 +60,20 @@
 #define I8K_POWER_AC		0x05
 #define I8K_POWER_BATTERY	0x01

-static DEFINE_MUTEX(i8k_mutex);
-static char bios_version[4];
-static char bios_machineid[16];
-static struct device *i8k_hwmon_dev;
-static u32 i8k_hwmon_flags;
-static uint i8k_fan_mult =3D I8K_FAN_MULT;
-static uint i8k_pwm_mult;
-static uint i8k_fan_max =3D I8K_FAN_HIGH;
-static bool disallow_fan_type_call;
-static bool disallow_fan_support;
-static unsigned int manual_fan;
-static unsigned int auto_fan;
+struct dell_smm_data {
+	struct mutex i8k_mutex; /* lock for sensors writes */
+	char bios_version[4];
+	char bios_machineid[16];
+	u32 i8k_hwmon_flags;
+	uint i8k_fan_mult;
+	uint i8k_pwm_mult;
+	uint i8k_fan_max;
+	bool disallow_fan_type_call;
+	bool disallow_fan_support;
+	unsigned int manual_fan;
+	unsigned int auto_fan;
+	int types[3];
+};

 #define I8K_HWMON_HAVE_TEMP1	(1 << 0)
 #define I8K_HWMON_HAVE_TEMP2	(1 << 1)
@@ -240,11 +242,11 @@ static int i8k_smm(struct smm_regs *regs)
 /*
  * Read the fan status.
  */
-static int i8k_get_fan_status(int fan)
+static int i8k_get_fan_status(const struct dell_smm_data *data, int fan)
 {
 	struct smm_regs regs =3D { .eax =3D I8K_SMM_GET_FAN, };

-	if (disallow_fan_support)
+	if (data->disallow_fan_support)
 		return -EINVAL;

 	regs.ebx =3D fan & 0xff;
@@ -254,84 +256,82 @@ static int i8k_get_fan_status(int fan)
 /*
  * Read the fan speed in RPM.
  */
-static int i8k_get_fan_speed(int fan)
+static int i8k_get_fan_speed(const struct dell_smm_data *data, int fan)
 {
 	struct smm_regs regs =3D { .eax =3D I8K_SMM_GET_SPEED, };

-	if (disallow_fan_support)
+	if (data->disallow_fan_support)
 		return -EINVAL;

 	regs.ebx =3D fan & 0xff;
-	return i8k_smm(&regs) ? : (regs.eax & 0xffff) * i8k_fan_mult;
+	return i8k_smm(&regs) ? : (regs.eax & 0xffff) * data->i8k_fan_mult;
 }

 /*
  * Read the fan type.
  */
-static int _i8k_get_fan_type(int fan)
+static int _i8k_get_fan_type(const struct dell_smm_data *data, int fan)
 {
 	struct smm_regs regs =3D { .eax =3D I8K_SMM_GET_FAN_TYPE, };

-	if (disallow_fan_support || disallow_fan_type_call)
+	if (data->disallow_fan_support || data->disallow_fan_type_call)
 		return -EINVAL;

 	regs.ebx =3D fan & 0xff;
 	return i8k_smm(&regs) ? : regs.eax & 0xff;
 }

-static int i8k_get_fan_type(int fan)
+static int i8k_get_fan_type(struct dell_smm_data *data, int fan)
 {
 	/* I8K_SMM_GET_FAN_TYPE SMM call is expensive, so cache values */
-	static int types[3] =3D { INT_MIN, INT_MIN, INT_MIN };
+	if (data->types[fan] =3D=3D INT_MIN)
+		data->types[fan] =3D _i8k_get_fan_type(data, fan);

-	if (types[fan] =3D=3D INT_MIN)
-		types[fan] =3D _i8k_get_fan_type(fan);
-
-	return types[fan];
+	return data->types[fan];
 }

 /*
  * Read the fan nominal rpm for specific fan speed.
  */
-static int i8k_get_fan_nominal_speed(int fan, int speed)
+static int i8k_get_fan_nominal_speed(const struct dell_smm_data *data, in=
t fan, int speed)
 {
 	struct smm_regs regs =3D { .eax =3D I8K_SMM_GET_NOM_SPEED, };

-	if (disallow_fan_support)
+	if (data->disallow_fan_support)
 		return -EINVAL;

 	regs.ebx =3D (fan & 0xff) | (speed << 8);
-	return i8k_smm(&regs) ? : (regs.eax & 0xffff) * i8k_fan_mult;
+	return i8k_smm(&regs) ? : (regs.eax & 0xffff) * data->i8k_fan_mult;
 }

 /*
  * Enable or disable automatic BIOS fan control support
  */
-static int i8k_enable_fan_auto_mode(bool enable)
+static int i8k_enable_fan_auto_mode(const struct dell_smm_data *data, boo=
l enable)
 {
 	struct smm_regs regs =3D { };

-	if (disallow_fan_support)
+	if (data->disallow_fan_support)
 		return -EINVAL;

-	regs.eax =3D enable ? auto_fan : manual_fan;
+	regs.eax =3D enable ? data->auto_fan : data->manual_fan;
 	return i8k_smm(&regs);
 }

 /*
  * Set the fan speed (off, low, high). Returns the new fan status.
  */
-static int i8k_set_fan(int fan, int speed)
+static int i8k_set_fan(const struct dell_smm_data *data, int fan, int spe=
ed)
 {
 	struct smm_regs regs =3D { .eax =3D I8K_SMM_SET_FAN, };

-	if (disallow_fan_support)
+	if (data->disallow_fan_support)
 		return -EINVAL;

-	speed =3D (speed < 0) ? 0 : ((speed > i8k_fan_max) ? i8k_fan_max : speed=
);
+	speed =3D (speed < 0) ? 0 : ((speed > data->i8k_fan_max) ? data->i8k_fan=
_max : speed);
 	regs.ebx =3D (fan & 0xff) | (speed << 8);

-	return i8k_smm(&regs) ? : i8k_get_fan_status(fan);
+	return i8k_smm(&regs) ? : i8k_get_fan_status(data, fan);
 }

 static int i8k_get_temp_type(int sensor)
@@ -442,7 +442,7 @@ static int i8k_get_power_status(void)
  */

 static int
-i8k_ioctl_unlocked(struct file *fp, unsigned int cmd, unsigned long arg)
+i8k_ioctl_unlocked(struct file *fp, struct dell_smm_data *data, unsigned =
int cmd, unsigned long arg)
 {
 	int val =3D 0;
 	int speed;
@@ -454,12 +454,12 @@ i8k_ioctl_unlocked(struct file *fp, unsigned int cmd=
, unsigned long arg)

 	switch (cmd) {
 	case I8K_BIOS_VERSION:
-		if (!isdigit(bios_version[0]) || !isdigit(bios_version[1]) ||
-		    !isdigit(bios_version[2]))
+		if (!isdigit(data->bios_version[0]) || !isdigit(data->bios_version[1]) =
||
+		    !isdigit(data->bios_version[2]))
 			return -EINVAL;

-		val =3D (bios_version[0] << 16) |
-				(bios_version[1] << 8) | bios_version[2];
+		val =3D (data->bios_version[0] << 16) |
+				(data->bios_version[1] << 8) | data->bios_version[2];
 		break;

 	case I8K_MACHINE_ID:
@@ -467,7 +467,7 @@ i8k_ioctl_unlocked(struct file *fp, unsigned int cmd, =
unsigned long arg)
 			return -EPERM;

 		memset(buff, 0, sizeof(buff));
-		strlcpy(buff, bios_machineid, sizeof(buff));
+		strscpy(buff, data->bios_machineid, sizeof(buff));
 		break;

 	case I8K_FN_STATUS:
@@ -486,14 +486,14 @@ i8k_ioctl_unlocked(struct file *fp, unsigned int cmd=
, unsigned long arg)
 		if (copy_from_user(&val, argp, sizeof(int)))
 			return -EFAULT;

-		val =3D i8k_get_fan_speed(val);
+		val =3D i8k_get_fan_speed(data, val);
 		break;

 	case I8K_GET_FAN:
 		if (copy_from_user(&val, argp, sizeof(int)))
 			return -EFAULT;

-		val =3D i8k_get_fan_status(val);
+		val =3D i8k_get_fan_status(data, val);
 		break;

 	case I8K_SET_FAN:
@@ -506,7 +506,7 @@ i8k_ioctl_unlocked(struct file *fp, unsigned int cmd, =
unsigned long arg)
 		if (copy_from_user(&speed, argp + 1, sizeof(int)))
 			return -EFAULT;

-		val =3D i8k_set_fan(val, speed);
+		val =3D i8k_set_fan(data, val, speed);
 		break;

 	default:
@@ -539,11 +539,12 @@ i8k_ioctl_unlocked(struct file *fp, unsigned int cmd=
, unsigned long arg)

 static long i8k_ioctl(struct file *fp, unsigned int cmd, unsigned long ar=
g)
 {
+	struct dell_smm_data *data =3D PDE_DATA(file_inode(fp));
 	long ret;

-	mutex_lock(&i8k_mutex);
-	ret =3D i8k_ioctl_unlocked(fp, cmd, arg);
-	mutex_unlock(&i8k_mutex);
+	mutex_lock(&data->i8k_mutex);
+	ret =3D i8k_ioctl_unlocked(fp, data, cmd, arg);
+	mutex_unlock(&data->i8k_mutex);

 	return ret;
 }
@@ -553,17 +554,18 @@ static long i8k_ioctl(struct file *fp, unsigned int =
cmd, unsigned long arg)
  */
 static int i8k_proc_show(struct seq_file *seq, void *offset)
 {
+	struct dell_smm_data *data =3D seq->private;
 	int fn_key, cpu_temp, ac_power;
 	int left_fan, right_fan, left_speed, right_speed;

-	cpu_temp	=3D i8k_get_temp(0);			/* 11100 =C2=B5s */
-	left_fan	=3D i8k_get_fan_status(I8K_FAN_LEFT);	/*   580 =C2=B5s */
-	right_fan	=3D i8k_get_fan_status(I8K_FAN_RIGHT);	/*   580 =C2=B5s */
-	left_speed	=3D i8k_get_fan_speed(I8K_FAN_LEFT);	/*   580 =C2=B5s */
-	right_speed	=3D i8k_get_fan_speed(I8K_FAN_RIGHT);	/*   580 =C2=B5s */
-	fn_key		=3D i8k_get_fn_status();			/*   750 =C2=B5s */
+	cpu_temp	=3D i8k_get_temp(0);				/* 11100 =C2=B5s */
+	left_fan	=3D i8k_get_fan_status(data, I8K_FAN_LEFT);	/*   580 =C2=B5s */
+	right_fan	=3D i8k_get_fan_status(data, I8K_FAN_RIGHT);	/*   580 =C2=B5s =
*/
+	left_speed	=3D i8k_get_fan_speed(data, I8K_FAN_LEFT);	/*   580 =C2=B5s *=
/
+	right_speed	=3D i8k_get_fan_speed(data, I8K_FAN_RIGHT);	/*   580 =C2=B5s=
 */
+	fn_key		=3D i8k_get_fn_status();				/*   750 =C2=B5s */
 	if (power_status)
-		ac_power =3D i8k_get_power_status();		/* 14700 =C2=B5s */
+		ac_power =3D i8k_get_power_status();			/* 14700 =C2=B5s */
 	else
 		ac_power =3D -1;

@@ -583,8 +585,8 @@ static int i8k_proc_show(struct seq_file *seq, void *o=
ffset)
 	 */
 	seq_printf(seq, "%s %s %s %d %d %d %d %d %d %d\n",
 		   I8K_PROC_FMT,
-		   bios_version,
-		   (restricted && !capable(CAP_SYS_ADMIN)) ? "-1" : bios_machineid,
+		   data->bios_version,
+		   (restricted && !capable(CAP_SYS_ADMIN)) ? "-1" : data->bios_machinei=
d,
 		   cpu_temp,
 		   left_fan, right_fan, left_speed, right_speed,
 		   ac_power, fn_key);
@@ -594,7 +596,7 @@ static int i8k_proc_show(struct seq_file *seq, void *o=
ffset)

 static int i8k_open_fs(struct inode *inode, struct file *file)
 {
-	return single_open(file, i8k_proc_show, NULL);
+	return single_open(file, i8k_proc_show, PDE_DATA(inode));
 }

 static const struct proc_ops i8k_proc_ops =3D {
@@ -612,8 +614,10 @@ static void i8k_exit_procfs(void *param)

 static void __init i8k_init_procfs(struct device *dev)
 {
+	struct dell_smm_data *data =3D dev_get_drvdata(dev);
+
 	/* Register the proc entry */
-	proc_create("i8k", 0, NULL, &i8k_proc_ops);
+	proc_create_data("i8k", 0, NULL, &i8k_proc_ops, data);

 	devm_add_action_or_reset(dev, i8k_exit_procfs, NULL);
 }
@@ -670,6 +674,7 @@ static ssize_t i8k_hwmon_fan_label_show(struct device =
*dev,
 					struct device_attribute *devattr,
 					char *buf)
 {
+	struct dell_smm_data *data =3D dev_get_drvdata(dev);
 	static const char * const labels[] =3D {
 		"Processor Fan",
 		"Motherboard Fan",
@@ -682,7 +687,7 @@ static ssize_t i8k_hwmon_fan_label_show(struct device =
*dev,
 	bool dock =3D false;
 	int type;

-	type =3D i8k_get_fan_type(index);
+	type =3D i8k_get_fan_type(data, index);
 	if (type < 0)
 		return type;

@@ -700,10 +705,11 @@ static ssize_t i8k_hwmon_fan_label_show(struct devic=
e *dev,
 static ssize_t i8k_hwmon_fan_show(struct device *dev,
 				  struct device_attribute *devattr, char *buf)
 {
+	struct dell_smm_data *data =3D dev_get_drvdata(dev);
 	int index =3D to_sensor_dev_attr(devattr)->index;
 	int fan_speed;

-	fan_speed =3D i8k_get_fan_speed(index);
+	fan_speed =3D i8k_get_fan_speed(data, index);
 	if (fan_speed < 0)
 		return fan_speed;
 	return sprintf(buf, "%d\n", fan_speed);
@@ -712,19 +718,21 @@ static ssize_t i8k_hwmon_fan_show(struct device *dev=
,
 static ssize_t i8k_hwmon_pwm_show(struct device *dev,
 				  struct device_attribute *devattr, char *buf)
 {
+	struct dell_smm_data *data =3D dev_get_drvdata(dev);
 	int index =3D to_sensor_dev_attr(devattr)->index;
 	int status;

-	status =3D i8k_get_fan_status(index);
+	status =3D i8k_get_fan_status(data, index);
 	if (status < 0)
 		return -EIO;
-	return sprintf(buf, "%d\n", clamp_val(status * i8k_pwm_mult, 0, 255));
+	return sprintf(buf, "%d\n", clamp_val(status * data->i8k_pwm_mult, 0, 25=
5));
 }

 static ssize_t i8k_hwmon_pwm_store(struct device *dev,
 				   struct device_attribute *attr,
 				   const char *buf, size_t count)
 {
+	struct dell_smm_data *data =3D dev_get_drvdata(dev);
 	int index =3D to_sensor_dev_attr(attr)->index;
 	unsigned long val;
 	int err;
@@ -732,11 +740,11 @@ static ssize_t i8k_hwmon_pwm_store(struct device *de=
v,
 	err =3D kstrtoul(buf, 10, &val);
 	if (err)
 		return err;
-	val =3D clamp_val(DIV_ROUND_CLOSEST(val, i8k_pwm_mult), 0, i8k_fan_max);
+	val =3D clamp_val(DIV_ROUND_CLOSEST(val, data->i8k_pwm_mult), 0, data->i=
8k_fan_max);

-	mutex_lock(&i8k_mutex);
-	err =3D i8k_set_fan(index, val);
-	mutex_unlock(&i8k_mutex);
+	mutex_lock(&data->i8k_mutex);
+	err =3D i8k_set_fan(data, index, val);
+	mutex_unlock(&data->i8k_mutex);

 	return err < 0 ? -EIO : count;
 }
@@ -745,11 +753,12 @@ static ssize_t i8k_hwmon_pwm_enable_store(struct dev=
ice *dev,
 					  struct device_attribute *attr,
 					  const char *buf, size_t count)
 {
+	struct dell_smm_data *data =3D dev_get_drvdata(dev);
 	int err;
 	bool enable;
 	unsigned long val;

-	if (!auto_fan)
+	if (!data->auto_fan)
 		return -ENODEV;

 	err =3D kstrtoul(buf, 10, &val);
@@ -763,9 +772,9 @@ static ssize_t i8k_hwmon_pwm_enable_store(struct devic=
e *dev,
 	else
 		return -EINVAL;

-	mutex_lock(&i8k_mutex);
-	err =3D i8k_enable_fan_auto_mode(enable);
-	mutex_unlock(&i8k_mutex);
+	mutex_lock(&data->i8k_mutex);
+	err =3D i8k_enable_fan_auto_mode(data, enable);
+	mutex_unlock(&data->i8k_mutex);

 	return err ? err : count;
 }
@@ -838,53 +847,56 @@ static struct attribute *i8k_attrs[] =3D {
 static umode_t i8k_is_visible(struct kobject *kobj, struct attribute *att=
r,
 			      int index)
 {
-	if (disallow_fan_support && index >=3D 20)
+	struct device *dev =3D kobj_to_dev(kobj);
+	struct dell_smm_data *data =3D dev_get_drvdata(dev);
+
+	if (data->disallow_fan_support && index >=3D 20)
 		return 0;
-	if (disallow_fan_type_call &&
+	if (data->disallow_fan_type_call &&
 	    (index =3D=3D 21 || index =3D=3D 25 || index =3D=3D 28))
 		return 0;
 	if (index >=3D 0 && index <=3D 1 &&
-	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP1))
+	    !(data->i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP1))
 		return 0;
 	if (index >=3D 2 && index <=3D 3 &&
-	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP2))
+	    !(data->i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP2))
 		return 0;
 	if (index >=3D 4 && index <=3D 5 &&
-	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP3))
+	    !(data->i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP3))
 		return 0;
 	if (index >=3D 6 && index <=3D 7 &&
-	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP4))
+	    !(data->i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP4))
 		return 0;
 	if (index >=3D 8 && index <=3D 9 &&
-	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP5))
+	    !(data->i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP5))
 		return 0;
 	if (index >=3D 10 && index <=3D 11 &&
-	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP6))
+	    !(data->i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP6))
 		return 0;
 	if (index >=3D 12 && index <=3D 13 &&
-	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP7))
+	    !(data->i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP7))
 		return 0;
 	if (index >=3D 14 && index <=3D 15 &&
-	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP8))
+	    !(data->i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP8))
 		return 0;
 	if (index >=3D 16 && index <=3D 17 &&
-	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP9))
+	    !(data->i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP9))
 		return 0;
 	if (index >=3D 18 && index <=3D 19 &&
-	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP10))
+	    !(data->i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP10))
 		return 0;

 	if (index >=3D 20 && index <=3D 23 &&
-	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN1))
+	    !(data->i8k_hwmon_flags & I8K_HWMON_HAVE_FAN1))
 		return 0;
 	if (index >=3D 24 && index <=3D 26 &&
-	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN2))
+	    !(data->i8k_hwmon_flags & I8K_HWMON_HAVE_FAN2))
 		return 0;
 	if (index >=3D 27 && index <=3D 29 &&
-	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN3))
+	    !(data->i8k_hwmon_flags & I8K_HWMON_HAVE_FAN3))
 		return 0;

-	if (index =3D=3D 23 && !auto_fan)
+	if (index =3D=3D 23 && !data->auto_fan)
 		return 0;

 	return attr->mode;
@@ -898,65 +910,65 @@ __ATTRIBUTE_GROUPS(i8k);

 static int __init dell_smm_init_hwmon(struct device *dev)
 {
+	struct dell_smm_data *data =3D dev_get_drvdata(dev);
+	struct device *i8k_hwmon_dev;
 	int err;

-	i8k_hwmon_flags =3D 0;
-
 	/* CPU temperature attributes, if temperature type is OK */
 	err =3D i8k_get_temp_type(0);
 	if (err >=3D 0)
-		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP1;
+		data->i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP1;
 	/* check for additional temperature sensors */
 	err =3D i8k_get_temp_type(1);
 	if (err >=3D 0)
-		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP2;
+		data->i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP2;
 	err =3D i8k_get_temp_type(2);
 	if (err >=3D 0)
-		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP3;
+		data->i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP3;
 	err =3D i8k_get_temp_type(3);
 	if (err >=3D 0)
-		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP4;
+		data->i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP4;
 	err =3D i8k_get_temp_type(4);
 	if (err >=3D 0)
-		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP5;
+		data->i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP5;
 	err =3D i8k_get_temp_type(5);
 	if (err >=3D 0)
-		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP6;
+		data->i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP6;
 	err =3D i8k_get_temp_type(6);
 	if (err >=3D 0)
-		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP7;
+		data->i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP7;
 	err =3D i8k_get_temp_type(7);
 	if (err >=3D 0)
-		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP8;
+		data->i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP8;
 	err =3D i8k_get_temp_type(8);
 	if (err >=3D 0)
-		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP9;
+		data->i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP9;
 	err =3D i8k_get_temp_type(9);
 	if (err >=3D 0)
-		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP10;
+		data->i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP10;

 	/* First fan attributes, if fan status or type is OK */
-	err =3D i8k_get_fan_status(0);
+	err =3D i8k_get_fan_status(data, 0);
 	if (err < 0)
-		err =3D i8k_get_fan_type(0);
+		err =3D i8k_get_fan_type(data, 0);
 	if (err >=3D 0)
-		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_FAN1;
+		data->i8k_hwmon_flags |=3D I8K_HWMON_HAVE_FAN1;

 	/* Second fan attributes, if fan status or type is OK */
-	err =3D i8k_get_fan_status(1);
+	err =3D i8k_get_fan_status(data, 1);
 	if (err < 0)
-		err =3D i8k_get_fan_type(1);
+		err =3D i8k_get_fan_type(data, 1);
 	if (err >=3D 0)
-		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_FAN2;
+		data->i8k_hwmon_flags |=3D I8K_HWMON_HAVE_FAN2;

 	/* Third fan attributes, if fan status or type is OK */
-	err =3D i8k_get_fan_status(2);
+	err =3D i8k_get_fan_status(data, 2);
 	if (err < 0)
-		err =3D i8k_get_fan_type(2);
+		err =3D i8k_get_fan_type(data, 2);
 	if (err >=3D 0)
-		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_FAN3;
+		data->i8k_hwmon_flags |=3D I8K_HWMON_HAVE_FAN3;

-	i8k_hwmon_dev =3D devm_hwmon_device_register_with_groups(dev, "dell_smm"=
, NULL, i8k_groups);
+	i8k_hwmon_dev =3D devm_hwmon_device_register_with_groups(dev, "dell_smm"=
, data, i8k_groups);

 	return PTR_ERR_OR_ZERO(i8k_hwmon_dev);
 }
@@ -1217,25 +1229,38 @@ static struct dmi_system_id i8k_whitelist_fan_cont=
rol[] __initdata =3D {

 static int __init dell_smm_probe(struct platform_device *pdev)
 {
+	struct dell_smm_data *data;
 	const struct dmi_system_id *id, *fan_control;
 	int fan, ret;

+	data =3D devm_kzalloc(&pdev->dev, sizeof(struct dell_smm_data), GFP_KERN=
EL);
+	if (!data)
+		return -ENOMEM;
+
+	mutex_init(&data->i8k_mutex);
+	data->i8k_fan_mult =3D I8K_FAN_MULT;
+	data->i8k_fan_max =3D I8K_FAN_HIGH;
+	data->types[0] =3D INT_MIN;
+	data->types[1] =3D INT_MIN;
+	data->types[2] =3D INT_MIN;
+	platform_set_drvdata(pdev, data);
+
 	if (dmi_check_system(i8k_blacklist_fan_support_dmi_table)) {
-		pr_warn("broken Dell BIOS detected, disallow fan support\n");
+		dev_warn(&pdev->dev, "broken Dell BIOS detected, disallow fan support\n=
");
 		if (!force)
-			disallow_fan_support =3D true;
+			data->disallow_fan_support =3D true;
 	}

 	if (dmi_check_system(i8k_blacklist_fan_type_dmi_table)) {
-		pr_warn("broken Dell BIOS detected, disallow fan type call\n");
+		dev_warn(&pdev->dev, "broken Dell BIOS detected, disallow fan type call=
\n");
 		if (!force)
-			disallow_fan_type_call =3D true;
+			data->disallow_fan_type_call =3D true;
 	}

-	strscpy(bios_version, i8k_get_dmi_data(DMI_BIOS_VERSION),
-		sizeof(bios_version));
-	strscpy(bios_machineid, i8k_get_dmi_data(DMI_PRODUCT_SERIAL),
-		sizeof(bios_machineid));
+	strscpy(data->bios_version, i8k_get_dmi_data(DMI_BIOS_VERSION),
+		sizeof(data->bios_version));
+	strscpy(data->bios_machineid, i8k_get_dmi_data(DMI_PRODUCT_SERIAL),
+		sizeof(data->bios_machineid));

 	/*
 	 * Set fan multiplier and maximal fan speed from dmi config
@@ -1247,20 +1272,21 @@ static int __init dell_smm_probe(struct platform_d=
evice *pdev)

 		if (!fan_mult && conf->fan_mult)
 			fan_mult =3D conf->fan_mult;
+
 		if (!fan_max && conf->fan_max)
 			fan_max =3D conf->fan_max;
 	}

-	i8k_fan_max =3D fan_max ? : I8K_FAN_HIGH;	/* Must not be 0 */
-	i8k_pwm_mult =3D DIV_ROUND_UP(255, i8k_fan_max);
+	data->i8k_fan_max =3D fan_max ? : I8K_FAN_HIGH;	/* Must not be 0 */
+	data->i8k_pwm_mult =3D DIV_ROUND_UP(255, data->i8k_fan_max);

 	fan_control =3D dmi_first_match(i8k_whitelist_fan_control);
 	if (fan_control && fan_control->driver_data) {
-		const struct i8k_fan_control_data *data =3D fan_control->driver_data;
+		const struct i8k_fan_control_data *control =3D fan_control->driver_data=
;

-		manual_fan =3D data->manual_fan;
-		auto_fan =3D data->auto_fan;
-		pr_info("enabling support for setting automatic/manual fan control\n");
+		data->manual_fan =3D control->manual_fan;
+		data->auto_fan =3D control->auto_fan;
+		dev_info(&pdev->dev, "enabling support for setting automatic/manual fan=
 control\n");
 	}

 	if (!fan_mult) {
@@ -1269,16 +1295,17 @@ static int __init dell_smm_probe(struct platform_d=
evice *pdev)
 		 * If fan reports rpm value too high then set multiplier to 1
 		 */
 		for (fan =3D 0; fan < 2; ++fan) {
-			ret =3D i8k_get_fan_nominal_speed(fan, i8k_fan_max);
+			ret =3D i8k_get_fan_nominal_speed(data, fan, data->i8k_fan_max);
 			if (ret < 0)
 				continue;
+
 			if (ret > I8K_FAN_MAX_RPM)
-				i8k_fan_mult =3D 1;
+				data->i8k_fan_mult =3D 1;
 			break;
 		}
 	} else {
 		/* Fan multiplier was specified in module param or in dmi */
-		i8k_fan_mult =3D fan_mult;
+		data->i8k_fan_mult =3D fan_mult;
 	}

 	ret =3D dell_smm_init_hwmon(&pdev->dev);
=2D-
2.20.1

