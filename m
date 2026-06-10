Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AD14963C8;
	Wed, 10 Jun 2026 20:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781123726; cv=none; b=kD6IZJmT3O5gWQxJj9vE3qtRoTgGzjcZHeoyAuC+hcmJ/psRbSdvlpBsrBMz2nXqIdMIl/IIZ9vU4q4UuVyNvLWFXlT4qsziibfFWMxYv3/oiNApFWGFpj1tA1vxV0L1tDOqL6PTOBe1MoSuyvCSWgd9Z3+62EexH354+nx4sQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781123726; c=relaxed/simple;
	bh=lSfyny9lqGUZXFvJHHE6gDoSsP2vV4TYziD4LBU+HTM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jnYMNBoPC+UeYTyc/ZEgT4SLCurUn6tEAuP+WUo4KFLzybwunxbBQE+rFBJhN2JFg5J6bCFeBz1GdOiTHTKFcB3ejtCmy881fb/i9u766hN3o8hysY17vy3P0qwbd/eCxj/lENdbZ6jlXpTBVElYxlfkMdVGSoWs5+QCyaqfaTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=KQap/i+Q; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="KQap/i+Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1781123714; x=1781728514; i=w_armin@gmx.de;
	bh=MQ9Qr/M35n4h84/MiKljzSNSosLd4qG/u6tyG3fiD0o=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=KQap/i+QUWT/0Jg804NMzoiO8xzaNtpxeeUv9u7bSji3BV6X1p4eRf1J9z1ElFze
	 zKN3BNQH5Hj/UWHmxX4cpboZcdp//IUCWsEivwmgnfHVplhVhNRnrUWGu6oEsLTGA
	 esTeoh0QVW+i3cK0ckvAgnN7NN9MowsOVv+lEsyMMaF/YhiXT2aOhNcnc/FZCV7Wu
	 ho7jFA4dhrbzb5HL86eVDR80jmE1cVHADkmU66dccTS756zhDyQoLg+uDUleCAc2Q
	 5ZF9pnW95WDh0oLJ8Y0B/9Xzq6m0pVx9jbs3+ztIj82VkD1E+W66DTK9+EZ7ulFYy
	 RDP8fjRWZCgLBjL1JA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M6lpG-1wbH031uHe-00EZZ6; Wed, 10
 Jun 2026 22:35:14 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: Dell.Client.Kernel@dell.com,
	pali@kernel.org,
	mjg59@srcf.ucam.org
Cc: soyer@irl.hu,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	mario.limonciello@amd.com
Subject: [PATCH v6 5/9] platform/x86: dell-ddv: Use new buffer-based WMI API
Date: Wed, 10 Jun 2026 22:34:49 +0200
Message-Id: <20260610203453.816254-6-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260610203453.816254-1-W_Armin@gmx.de>
References: <20260610203453.816254-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:T2CmUh85JfJvvLhKBPxXdxcRp8MEwEqhRmVgouHT0tavLjD+k6x
 mltfSQtPvOYbkBvvVpP7xYnUVog5pZb5XF76Nzc4rOKN/i6xZxHZya1Zsd3h6Z0EPUcDTFb
 FwiARjVYuuqw6urkss2Zm7TrNnW+X7v2c30K220T6+SwHDshBQz7QJ1GABqhejtDMGw9Oo/
 7SooxpJsfhGNkEyQQwJyw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:UsbNBXrUqik=;98yBdOdJInjQ6k2XFtAXIqaVLU1
 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

Use the new buffer-based WMI API to also support ACPI firmware
implementations that do not use ACPI intergers/strings/packages
for exchanging data.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/dell/dell-wmi-ddv.c | 179 +++++++++++------------
 1 file changed, 85 insertions(+), 94 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-ddv.c b/drivers/platform/x=
86/dell/dell-wmi-ddv.c
index 62e3d060f038..736d9b1fdcfb 100644
=2D-- a/drivers/platform/x86/dell/dell-wmi-ddv.c
+++ b/drivers/platform/x86/dell/dell-wmi-ddv.c
@@ -7,8 +7,9 @@
=20
 #define pr_format(fmt) KBUILD_MODNAME ": " fmt
=20
-#include <linux/acpi.h>
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
+#include <linux/compiler_attributes.h>
 #include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/device/driver.h>
@@ -99,6 +100,11 @@ enum dell_ddv_method {
 	DELL_DDV_THERMAL_SENSOR_INFORMATION	=3D 0x22,
 };
=20
+struct dell_wmi_buffer {
+	__le32 raw_size;
+	u8 raw_data[];
+} __packed;
+
 struct fan_sensor_entry {
 	u8 type;
 	__le16 rpm;
@@ -126,7 +132,7 @@ struct dell_wmi_ddv_sensors {
 	bool active;
 	struct mutex lock;	/* protect caching */
 	unsigned long timestamp;
-	union acpi_object *obj;
+	struct dell_wmi_buffer *buffer;
 	u64 entries;
 };
=20
@@ -158,105 +164,96 @@ static const char * const fan_dock_labels[] =3D {
 	"Docking Chipset Fan",
 };
=20
-static int dell_wmi_ddv_query_type(struct wmi_device *wdev, enum dell_ddv=
_method method, u32 arg,
-				   union acpi_object **result, acpi_object_type type)
+static int dell_wmi_ddv_query(struct wmi_device *wdev, enum dell_ddv_meth=
od method, u32 arg,
+			      struct wmi_buffer *output, size_t min_size)
 {
-	struct acpi_buffer out =3D { ACPI_ALLOCATE_BUFFER, NULL };
-	const struct acpi_buffer in =3D {
-		.length =3D sizeof(arg),
-		.pointer =3D &arg,
+	__le32 arg2 =3D cpu_to_le32(arg);
+	const struct wmi_buffer input =3D {
+		.length =3D sizeof(arg2),
+		.data =3D &arg2,
 	};
-	union acpi_object *obj;
-	acpi_status ret;
-
-	ret =3D wmidev_evaluate_method(wdev, 0x0, method, &in, &out);
-	if (ACPI_FAILURE(ret))
-		return -EIO;
-
-	obj =3D out.pointer;
-	if (!obj)
-		return -ENODATA;
-
-	if (obj->type !=3D type) {
-		kfree(obj);
-		return -ENOMSG;
-	}
-
-	*result =3D obj;
=20
-	return 0;
+	return wmidev_invoke_method(wdev, 0x0, method, &input, output, min_size)=
;
 }
=20
 static int dell_wmi_ddv_query_integer(struct wmi_device *wdev, enum dell_=
ddv_method method,
 				      u32 arg, u32 *res)
 {
-	union acpi_object *obj;
+	struct wmi_buffer output;
 	int ret;
=20
-	ret =3D dell_wmi_ddv_query_type(wdev, method, arg, &obj, ACPI_TYPE_INTEG=
ER);
+	ret =3D dell_wmi_ddv_query(wdev, method, arg, &output, sizeof(__le32));
 	if (ret < 0)
 		return ret;
=20
-	if (obj->integer.value <=3D U32_MAX)
-		*res =3D (u32)obj->integer.value;
-	else
-		ret =3D -ERANGE;
+	__le32 *argr __free(kfree) =3D output.data;
=20
-	kfree(obj);
+	*res =3D le32_to_cpu(*argr);
=20
-	return ret;
+	return 0;
 }
=20
 static int dell_wmi_ddv_query_buffer(struct wmi_device *wdev, enum dell_d=
dv_method method,
-				     u32 arg, union acpi_object **result)
+				     u32 arg, struct dell_wmi_buffer **result)
 {
-	union acpi_object *obj;
-	u64 buffer_size;
+	struct dell_wmi_buffer *buffer;
+	struct wmi_buffer output;
+	size_t buffer_size;
 	int ret;
=20
-	ret =3D dell_wmi_ddv_query_type(wdev, method, arg, &obj, ACPI_TYPE_PACKA=
GE);
+	ret =3D dell_wmi_ddv_query(wdev, method, arg, &output, sizeof(*buffer));
 	if (ret < 0)
 		return ret;
=20
-	if (obj->package.count !=3D 2 ||
-	    obj->package.elements[0].type !=3D ACPI_TYPE_INTEGER ||
-	    obj->package.elements[1].type !=3D ACPI_TYPE_BUFFER) {
-		ret =3D -ENOMSG;
-
-		goto err_free;
-	}
-
-	buffer_size =3D obj->package.elements[0].integer.value;
-
-	if (!buffer_size) {
+	buffer =3D output.data;
+	if (!le32_to_cpu(buffer->raw_size)) {
 		ret =3D -ENODATA;
=20
 		goto err_free;
 	}
=20
-	if (buffer_size > obj->package.elements[1].buffer.length) {
+	buffer_size =3D struct_size(buffer, raw_data, le32_to_cpu(buffer->raw_si=
ze));
+	if (buffer_size > output.length) {
 		dev_warn(&wdev->dev,
-			 FW_WARN "WMI buffer size (%llu) exceeds ACPI buffer size (%d)\n",
-			 buffer_size, obj->package.elements[1].buffer.length);
+			 FW_WARN "Dell WMI buffer size (%zu) exceeds WMI buffer size (%zu)\n",
+			 buffer_size, output.length);
 		ret =3D -EMSGSIZE;
=20
 		goto err_free;
 	}
=20
-	*result =3D obj;
+	*result =3D buffer;
=20
 	return 0;
=20
 err_free:
-	kfree(obj);
+	kfree(output.data);
=20
 	return ret;
 }
=20
-static int dell_wmi_ddv_query_string(struct wmi_device *wdev, enum dell_d=
dv_method method,
-				     u32 arg, union acpi_object **result)
+static ssize_t dell_wmi_ddv_query_string(struct wmi_device *wdev, enum de=
ll_ddv_method method,
+					 u32 arg, char *buf, size_t length)
 {
-	return dell_wmi_ddv_query_type(wdev, method, arg, result, ACPI_TYPE_STRI=
NG);
+	struct wmi_buffer output;
+	size_t str_size;
+	int ret;
+
+	ret =3D dell_wmi_ddv_query(wdev, method, arg, &output, sizeof(struct wmi=
_string));
+	if (ret < 0)
+		return ret;
+
+	struct wmi_string *str __free(kfree) =3D output.data;
+
+	str_size =3D sizeof(*str) + le16_to_cpu(str->length);
+	if (str_size > output.length) {
+		dev_warn(&wdev->dev,
+			 FW_WARN "WMI string size (%zu) exceeds WMI buffer size (%zu)\n",
+			 str_size, output.length);
+		return -EMSGSIZE;
+	}
+
+	return wmi_string_to_utf8s(str, buf, length);
 }
=20
 /*
@@ -265,28 +262,26 @@ static int dell_wmi_ddv_query_string(struct wmi_devi=
ce *wdev, enum dell_ddv_meth
 static int dell_wmi_ddv_update_sensors(struct wmi_device *wdev, enum dell=
_ddv_method method,
 				       struct dell_wmi_ddv_sensors *sensors, size_t entry_size)
 {
+	struct dell_wmi_buffer *buffer;
 	u64 buffer_size, rem, entries;
-	union acpi_object *obj;
-	u8 *buffer;
 	int ret;
=20
-	if (sensors->obj) {
+	if (sensors->buffer) {
 		if (time_before(jiffies, sensors->timestamp + HZ))
 			return 0;
=20
-		kfree(sensors->obj);
-		sensors->obj =3D NULL;
+		kfree(sensors->buffer);
+		sensors->buffer =3D NULL;
 	}
=20
-	ret =3D dell_wmi_ddv_query_buffer(wdev, method, 0, &obj);
+	ret =3D dell_wmi_ddv_query_buffer(wdev, method, 0, &buffer);
 	if (ret < 0)
 		return ret;
=20
 	/* buffer format sanity check */
-	buffer_size =3D obj->package.elements[0].integer.value;
-	buffer =3D obj->package.elements[1].buffer.pointer;
+	buffer_size =3D le32_to_cpu(buffer->raw_size);
 	entries =3D div64_u64_rem(buffer_size, entry_size, &rem);
-	if (rem !=3D 1 || buffer[buffer_size - 1] !=3D 0xff) {
+	if (rem !=3D 1 || buffer->raw_data[buffer_size - 1] !=3D 0xff) {
 		ret =3D -ENOMSG;
 		goto err_free;
 	}
@@ -296,14 +291,14 @@ static int dell_wmi_ddv_update_sensors(struct wmi_de=
vice *wdev, enum dell_ddv_me
 		goto err_free;
 	}
=20
-	sensors->obj =3D obj;
+	sensors->buffer =3D buffer;
 	sensors->entries =3D entries;
 	sensors->timestamp =3D jiffies;
=20
 	return 0;
=20
 err_free:
-	kfree(obj);
+	kfree(buffer);
=20
 	return ret;
 }
@@ -328,7 +323,7 @@ static int dell_wmi_ddv_fan_read_channel(struct dell_w=
mi_ddv_data *data, u32 att
 	if (channel >=3D data->fans.entries)
 		return -ENXIO;
=20
-	entry =3D (struct fan_sensor_entry *)data->fans.obj->package.elements[1]=
.buffer.pointer;
+	entry =3D (struct fan_sensor_entry *)data->fans.buffer->raw_data;
 	switch (attr) {
 	case hwmon_fan_input:
 		*val =3D get_unaligned_le16(&entry[channel].rpm);
@@ -354,7 +349,7 @@ static int dell_wmi_ddv_temp_read_channel(struct dell_=
wmi_ddv_data *data, u32 at
 	if (channel >=3D data->temps.entries)
 		return -ENXIO;
=20
-	entry =3D (struct thermal_sensor_entry *)data->temps.obj->package.elemen=
ts[1].buffer.pointer;
+	entry =3D (struct thermal_sensor_entry *)data->temps.buffer->raw_data;
 	switch (attr) {
 	case hwmon_temp_input:
 		*val =3D entry[channel].now * 1000;
@@ -411,7 +406,7 @@ static int dell_wmi_ddv_fan_read_string(struct dell_wm=
i_ddv_data *data, int chan
 	if (channel >=3D data->fans.entries)
 		return -ENXIO;
=20
-	entry =3D (struct fan_sensor_entry *)data->fans.obj->package.elements[1]=
.buffer.pointer;
+	entry =3D (struct fan_sensor_entry *)data->fans.buffer->raw_data;
 	type =3D entry[channel].type;
 	switch (type) {
 	case 0x00 ... 0x07:
@@ -442,7 +437,7 @@ static int dell_wmi_ddv_temp_read_string(struct dell_w=
mi_ddv_data *data, int cha
 	if (channel >=3D data->temps.entries)
 		return -ENXIO;
=20
-	entry =3D (struct thermal_sensor_entry *)data->temps.obj->package.elemen=
ts[1].buffer.pointer;
+	entry =3D (struct thermal_sensor_entry *)data->temps.buffer->raw_data;
 	switch (entry[channel].type) {
 	case 0x00:
 		*str =3D "CPU";
@@ -553,8 +548,8 @@ static void dell_wmi_ddv_hwmon_cache_invalidate(struct=
 dell_wmi_ddv_sensors *sen
 		return;
=20
 	mutex_lock(&sensors->lock);
-	kfree(sensors->obj);
-	sensors->obj =3D NULL;
+	kfree(sensors->buffer);
+	sensors->buffer =3D NULL;
 	mutex_unlock(&sensors->lock);
 }
=20
@@ -564,7 +559,7 @@ static void dell_wmi_ddv_hwmon_cache_destroy(void *dat=
a)
=20
 	sensors->active =3D false;
 	mutex_destroy(&sensors->lock);
-	kfree(sensors->obj);
+	kfree(sensors->buffer);
 }
=20
 static struct hwmon_channel_info *dell_wmi_ddv_channel_init(struct wmi_de=
vice *wdev,
@@ -750,7 +745,7 @@ static void dell_wmi_battery_invalidate(struct dell_wm=
i_ddv_data *data,
 static ssize_t eppid_show(struct device *dev, struct device_attribute *at=
tr, char *buf)
 {
 	struct dell_wmi_ddv_data *data =3D container_of(attr, struct dell_wmi_dd=
v_data, eppid_attr);
-	union acpi_object *obj;
+	ssize_t count;
 	u32 index;
 	int ret;
=20
@@ -758,19 +753,19 @@ static ssize_t eppid_show(struct device *dev, struct=
 device_attribute *attr, cha
 	if (ret < 0)
 		return ret;
=20
-	ret =3D dell_wmi_ddv_query_string(data->wdev, DELL_DDV_BATTERY_EPPID, in=
dex, &obj);
-	if (ret < 0)
-		return ret;
-
-	if (obj->string.length !=3D DELL_EPPID_LENGTH && obj->string.length !=3D=
 DELL_EPPID_EXT_LENGTH)
-		dev_info_once(&data->wdev->dev, FW_INFO "Suspicious ePPID length (%d)\n=
",
-			      obj->string.length);
+	count =3D dell_wmi_ddv_query_string(data->wdev, DELL_DDV_BATTERY_EPPID, =
index, buf,
+					  PAGE_SIZE);
+	if (count < 0)
+		return count;
=20
-	ret =3D sysfs_emit(buf, "%s\n", obj->string.pointer);
+	if (count !=3D DELL_EPPID_LENGTH && count !=3D DELL_EPPID_EXT_LENGTH)
+		dev_info_once(&data->wdev->dev, FW_INFO "Suspicious ePPID length (%zd)\=
n", count);
=20
-	kfree(obj);
+	ret =3D sysfs_emit_at(buf, count, "\n");
+	if (ret < 0)
+		return ret;
=20
-	return ret;
+	return count + ret;
 }
=20
 static int dell_wmi_ddv_get_health(struct dell_wmi_ddv_data *data, u32 in=
dex,
@@ -994,19 +989,15 @@ static int dell_wmi_ddv_buffer_read(struct seq_file =
*seq, enum dell_ddv_method m
 {
 	struct device *dev =3D seq->private;
 	struct dell_wmi_ddv_data *data =3D dev_get_drvdata(dev);
-	union acpi_object *obj;
-	u64 size;
-	u8 *buf;
+	struct dell_wmi_buffer *buffer;
 	int ret;
=20
-	ret =3D dell_wmi_ddv_query_buffer(data->wdev, method, 0, &obj);
+	ret =3D dell_wmi_ddv_query_buffer(data->wdev, method, 0, &buffer);
 	if (ret < 0)
 		return ret;
=20
-	size =3D obj->package.elements[0].integer.value;
-	buf =3D obj->package.elements[1].buffer.pointer;
-	ret =3D seq_write(seq, buf, size);
-	kfree(obj);
+	ret =3D seq_write(seq, buffer->raw_data, le32_to_cpu(buffer->raw_size));
+	kfree(buffer);
=20
 	return ret;
 }
=2D-=20
2.39.5

