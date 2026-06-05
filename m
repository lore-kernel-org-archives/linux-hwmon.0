Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5447D3B19A8;
	Fri,  5 Jun 2026 18:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780683307; cv=none; b=o1HztSbi7A942bprlrl6mns0qrSRkUmWmx9Ebi+B2h5KhgIQi8QNpe6Fc0eAtOn/bbyXnsauWgW2DKgfxBbm4pr7u/XtPtJwQO1HIsNkfsPV5ZdObF7tEcLw45c46+KRZXgrebwpPP9NunkeRvwhczGD70Cukhz8ysgYXXVD6nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780683307; c=relaxed/simple;
	bh=3/YzKk5yd5e1YsG8VVvxYHpW6mg8qMfhG9Pzjjt2+Ns=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aJPDpW9nb5tSBpvb+vKvtrmP+l4zj3wFg4qo0FXQcrGf18VxcnmLMV7QZwuLoWbFVzZodxRhgtLT9j/VItuEVIGwrdgO092jf8Jv9syAyE4xvMExthQiKB1BhX69KgH6gjHX/RLrIHiocA81esTW6H2SJ4eqOUycKNBzaD3hMb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=AJAmu6Cm; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="AJAmu6Cm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780683283; x=1781288083; i=w_armin@gmx.de;
	bh=/VEsNeFCmDb3E2D6re555W182LKIUUc5SgS8t8OYxeg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=AJAmu6Cm0SMB2KWJ8nyJgHuvH5WQ8tDyTDSN5ohb//vSSu4vAUpo5npr7lU8EFFB
	 HwnbltF26ts/vhISQPJzXVnWJsywnsCof+kLDgZkNphio9zYbqrmvUibt16YFxVQe
	 yDe9/QJX19rD6Eo9HRM8JO1A/CnyceqpcOXxfkVm1sNV+2dyqfBWZno03eGBTvIaH
	 xKMBfcwlNT0nNgZMWY4uyhQLopDiyqRIaIZun8CgUqB6taZgryIN0oUwyvWgBmqnu
	 JJIUqVcr/DqZOKpnYkx5SqCXbLq8MoVPMPvHaxOl59F5dVTSLbpHOY9Bc7G5lmmIL
	 gbH5rujedSBvwMEsjA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M5fIQ-1wbbTN25fe-00BVHP; Fri, 05
 Jun 2026 20:14:43 +0200
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
Subject: [PATCH v4 5/9] platform/x86: dell-ddv: Use new buffer-based WMI API
Date: Fri,  5 Jun 2026 20:14:29 +0200
Message-Id: <20260605181433.188847-6-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260605181433.188847-1-W_Armin@gmx.de>
References: <20260605181433.188847-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ylEnwKu3sfX4lFxpfWX4g60haLt/wD3iqnYbYKM0YAlupSsRI6h
 AIEWRLzYTcF3HDk2h2asPSFxNxNRpgZ5VUmM9ikhs4IOQ+xAiwWV6KSXBsgjfEDoIjPb9o9
 ViDRRanHY9PGj0TFSKDi31N+oFaZTMK76570dzQm818Ws/hZsHcnr6FgtM3PfkHi0A0i4Su
 NIxwUKJ1P+inn+cukl7nQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NyIO6maXueE=;U2edmAnsg0lbAMgRVXvOF2JSshN
 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

Use the new buffer-based WMI API to also support ACPI firmware
implementations that do not use ACPI intergers/strings/packages
for exchanging data.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/dell/dell-wmi-ddv.c | 181 +++++++++++------------
 1 file changed, 86 insertions(+), 95 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-ddv.c b/drivers/platform/x=
86/dell/dell-wmi-ddv.c
index 62e3d060f038..c2120d8ae298 100644
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
+	__le32 *argr __free(kfree) =3D NULL;
+	struct wmi_buffer output;
 	int ret;
=20
-	ret =3D dell_wmi_ddv_query_type(wdev, method, arg, &obj, ACPI_TYPE_INTEG=
ER);
+	ret =3D dell_wmi_ddv_query(wdev, method, arg, &output, sizeof(*argr));
 	if (ret < 0)
 		return ret;
=20
-	if (obj->integer.value <=3D U32_MAX)
-		*res =3D (u32)obj->integer.value;
-	else
-		ret =3D -ERANGE;
-
-	kfree(obj);
+	argr =3D output.data;
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
+	struct wmi_string *str __free(kfree) =3D NULL;
+	struct wmi_buffer output;
+	size_t str_size;
+	int ret;
+
+	ret =3D dell_wmi_ddv_query(wdev, method, arg, &output, sizeof(*str));
+	if (ret < 0)
+		return ret;
+
+	str =3D output.data;
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

