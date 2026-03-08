Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2473C337BAD;
	Sun,  8 Mar 2026 20:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773000171; cv=none; b=dXDwpiUBZLqeuRwhjc0rpfkJqyScmBTw2p+4f77kI1XtbvDOkTwN/lKK4bKaqfyCdKxEGD4B7rYc3wj4Iiyv8pz1QzrlphW9iHdxfa0sSPrnPmQtL8RdfdzDQLabZdZqbE93wzb+oZnd9pi4Al3V5PTMY97gRiKpmsgGSeiSOpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773000171; c=relaxed/simple;
	bh=iPCUkxzT1pgRAs55EHDRcdwaaj7ZNbWDMLDA1ox4Qpk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ejz/GA99VnT75JqAXDOWwNag7CAiEXKz5WNG8RoOFbDjR45wL9DY0+KdSr1akE+lMX8vbtujm10qATbPhBdMYVzruVQHliyZeRJrJ4hiCE7RwAgkAxO/xTXk7qVoAzd9pzz+MO3PrGA0taGIANvxsQplSbzDboIfQiiYv4Tyruk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ABklgtef; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ABklgtef"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1773000154; x=1773604954; i=w_armin@gmx.de;
	bh=9yYEAN8R/q+eJ/epVkmHeoIfIOY6a1BOEdI7zdNvdbE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ABklgteflM5p7fec5bsEG5zl3emcOS7HHX1vd1rhP/5hO5hglz4NqE44JK4wIfSw
	 72NAh7byA1gSvedtsOWcQD7ZRSdcP34YrLfr/mUaXlH+dw/mbQX7sNsYe83Z4Ny81
	 JSX74sh1PUpIe3f+/e+y6vfqPIjCj4z2HjXDLYZwaG0FEub53iuRVpu2pv6a2d/Yt
	 Z4PnIAu8af3BCowbxOsm05HFWPa24ZBUd25U2sZsn6r22UMY6n7nsQCJzXQn8fxXX
	 S67y492ODVWFs1ysbRkj/1iOczAnNXY/rtyMZ7s7/V2nSSph+13bkC2Gkct6OZ3go
	 cWPcehgL/EWNL/TC2w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6sn7-1va7Rl1Ced-00vneW; Sun, 08
 Mar 2026 21:02:34 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: Dell.Client.Kernel@dell.com,
	pali@kernel.org,
	mjg59@srcf.ucam.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org
Subject: [PATCH v2 5/9] platform/x86: dell-ddv: Use new buffer-based WMI API
Date: Sun,  8 Mar 2026 21:01:51 +0100
Message-Id: <20260308200155.118950-6-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260308200155.118950-1-W_Armin@gmx.de>
References: <20260308200155.118950-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:agqDYl1amNZAOqZsDdwMj0Ro8DFvRIu2EccX843iBJSj1OYknV3
 JMtFZtYatvtHN2LE7c4a78OS02hyhmlYnn+9/iPjtRqsejNHOM8JJUiaBpvSI1aZ+VqlrOx
 IM84wVCM2TMWFW3WVJS5pN+QEsOpEmuj/kx0A5GxP4XEhx22RpTM0vMOcd7KwKc0EOXv9sq
 c8lHsOW0E26o6jZba8trA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:56KPh5vds8w=;25x6t0wbCCYBmtbKZk4JjTMoZud
 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

Use the new buffer-based WMI API to also support ACPI firmware
implementations that do not use ACPI intergers/strings/packages
for exchanging data.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/dell/dell-wmi-ddv.c | 194 ++++++++++++-----------
 1 file changed, 105 insertions(+), 89 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-ddv.c b/drivers/platform/x=
86/dell/dell-wmi-ddv.c
index 62e3d060f038..a744fd21b8af 100644
=2D-- a/drivers/platform/x86/dell/dell-wmi-ddv.c
+++ b/drivers/platform/x86/dell/dell-wmi-ddv.c
@@ -7,8 +7,8 @@
=20
 #define pr_format(fmt) KBUILD_MODNAME ": " fmt
=20
-#include <linux/acpi.h>
 #include <linux/bitfield.h>
+#include <linux/compiler_attributes.h>
 #include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/device/driver.h>
@@ -99,6 +99,11 @@ enum dell_ddv_method {
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
@@ -126,7 +131,7 @@ struct dell_wmi_ddv_sensors {
 	bool active;
 	struct mutex lock;	/* protect caching */
 	unsigned long timestamp;
-	union acpi_object *obj;
+	struct dell_wmi_buffer *buffer;
 	u64 entries;
 };
=20
@@ -158,105 +163,122 @@ static const char * const fan_dock_labels[] =3D {
 	"Docking Chipset Fan",
 };
=20
-static int dell_wmi_ddv_query_type(struct wmi_device *wdev, enum dell_ddv=
_method method, u32 arg,
-				   union acpi_object **result, acpi_object_type type)
+static int dell_wmi_ddv_query(struct wmi_device *wdev, enum dell_ddv_meth=
od method, u32 arg,
+			      struct wmi_buffer *output)
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
=20
-	if (obj->type !=3D type) {
-		kfree(obj);
-		return -ENOMSG;
-	}
-
-	*result =3D obj;
-
-	return 0;
+	return wmidev_invoke_method(wdev, 0x0, method, &input, output);
 }
=20
 static int dell_wmi_ddv_query_integer(struct wmi_device *wdev, enum dell_=
ddv_method method,
 				      u32 arg, u32 *res)
 {
-	union acpi_object *obj;
+	struct wmi_buffer output;
+	__le32 *argr;
 	int ret;
=20
-	ret =3D dell_wmi_ddv_query_type(wdev, method, arg, &obj, ACPI_TYPE_INTEG=
ER);
+	ret =3D dell_wmi_ddv_query(wdev, method, arg, &output);
 	if (ret < 0)
 		return ret;
=20
-	if (obj->integer.value <=3D U32_MAX)
-		*res =3D (u32)obj->integer.value;
-	else
-		ret =3D -ERANGE;
+	if (output.length >=3D sizeof(*argr)) {
+		argr =3D output.data;
+		*res =3D le32_to_cpu(*argr);
+	} else {
+		ret =3D -EIO;
+	}
=20
-	kfree(obj);
+	kfree(output.data);
=20
 	return ret;
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
+	ret =3D dell_wmi_ddv_query(wdev, method, arg, &output);
 	if (ret < 0)
 		return ret;
=20
-	if (obj->package.count !=3D 2 ||
-	    obj->package.elements[0].type !=3D ACPI_TYPE_INTEGER ||
-	    obj->package.elements[1].type !=3D ACPI_TYPE_BUFFER) {
-		ret =3D -ENOMSG;
+	if (output.length < sizeof(*buffer)) {
+		ret =3D -EIO;
=20
 		goto err_free;
 	}
=20
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
+	struct wmi_string *str;
+	size_t str_size;
+	ssize_t count;
+	int ret;
+
+	ret =3D dell_wmi_ddv_query(wdev, method, arg, &output);
+	if (ret < 0)
+		return ret;
+
+	if (output.length < sizeof(*str)) {
+		count =3D -EIO;
+
+		goto err_free;
+	}
+
+	str =3D output.data;
+	str_size =3D sizeof(*str) + le16_to_cpu(str->length);
+	if (str_size > output.length) {
+		dev_warn(&wdev->dev,
+			 FW_WARN "WMI string size (%zu) exceeds WMI buffer size (%zu)\n",
+			 str_size, output.length);
+		count =3D -EMSGSIZE;
+
+		goto err_free;
+	}
+
+	count =3D wmi_string_to_utf8s(str, buf, length);
+
+err_free:
+	kfree(output.data);
+
+	return count;
 }
=20
 /*
@@ -265,28 +287,26 @@ static int dell_wmi_ddv_query_string(struct wmi_devi=
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
@@ -296,14 +316,14 @@ static int dell_wmi_ddv_update_sensors(struct wmi_de=
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
@@ -328,7 +348,7 @@ static int dell_wmi_ddv_fan_read_channel(struct dell_w=
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
@@ -354,7 +374,7 @@ static int dell_wmi_ddv_temp_read_channel(struct dell_=
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
@@ -411,7 +431,7 @@ static int dell_wmi_ddv_fan_read_string(struct dell_wm=
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
@@ -442,7 +462,7 @@ static int dell_wmi_ddv_temp_read_string(struct dell_w=
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
@@ -553,8 +573,8 @@ static void dell_wmi_ddv_hwmon_cache_invalidate(struct=
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
@@ -564,7 +584,7 @@ static void dell_wmi_ddv_hwmon_cache_destroy(void *dat=
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
@@ -750,7 +770,7 @@ static void dell_wmi_battery_invalidate(struct dell_wm=
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
@@ -758,19 +778,19 @@ static ssize_t eppid_show(struct device *dev, struct=
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
@@ -994,19 +1014,15 @@ static int dell_wmi_ddv_buffer_read(struct seq_file=
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

