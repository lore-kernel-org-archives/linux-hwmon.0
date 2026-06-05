Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C481B34166B;
	Fri,  5 Jun 2026 21:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780693208; cv=none; b=IL/rwwcbseF0KexwqeeJKU7fwfKLWggSbV4eD2eR9N4hPzUr64pK+z1BdNOwlUooofju+zRsf/I6hs5PyesMj9N2hLUa6RPZe1jyiUImWEnopDW0FSSfeHNtAAYOiIkr+KHJGjv0YiEIT8umYbPAt5TsJxPHdmgXKzKuKi2q8DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780693208; c=relaxed/simple;
	bh=3/YzKk5yd5e1YsG8VVvxYHpW6mg8qMfhG9Pzjjt2+Ns=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z2G+/PHW91CDvAMkBDnWhoxD7bft1lkfIwm1ZHp/0qLHWodT6dzUnYSlFM6khGsqhol4fTrMtqZgYNmu8gLkTLW4EBSoUVNGrgCycHuCtDW289bbHRcpFxCsxHFMkKGoqA/F5dsACUQ6OVLtAjHlHD+UUVcGH2Vt4ux8PpwXWtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=BS6Oyszu; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="BS6Oyszu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780693188; x=1781297988; i=w_armin@gmx.de;
	bh=/VEsNeFCmDb3E2D6re555W182LKIUUc5SgS8t8OYxeg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=BS6OyszuXwIkq5rGZ6DyAVrbA3xtW8xjI3XFrxNhxEfCjP7WiTLLYtu5+n3K+l8A
	 QGFXtcWsRI5v+Bi5txqf3VkIKw7PdcQalKRDwm5mYT0eWc5PpWCctBO3REW75HYkp
	 sej5xI6GIUHP0G9yXoGXOBJjxD06yJinVLd7IopWEyttoaTHn7QIl8sv/fPkkMRZi
	 SfxVU+5Dnk5wo1iKg3r/XWDGylhuu0by2c3sTmQbQs1zGskDNYlbXSRmVRJ+IApBH
	 IECWT2zOh8PL9wwUaMfD7aCqtWq4LP6XLhRtZNjqcNO1f8oR1pDBtr2x0J/GWc49R
	 njzS3arNOhRN+N5pFg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M59C2-1wWi6S2548-007C3q; Fri, 05
 Jun 2026 22:59:48 +0200
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
Subject: [PATCH v5 5/9] platform/x86: dell-ddv: Use new buffer-based WMI API
Date: Fri,  5 Jun 2026 22:59:33 +0200
Message-Id: <20260605205937.530897-6-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260605205937.530897-1-W_Armin@gmx.de>
References: <20260605205937.530897-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7GFOBkZ+1raQkmiQRfq3XF1DrTBASftA5a3x0zBNLMMNqNX7oWp
 S+HNfbpaNrukkUzTTx9uHzdZXnhQFXw/Gup0qxtM9JmnuULZaLOEyvFlmP6NhRpQ0jHVHFg
 MnEl9SJohyPo/gW6jg5urp4xYSa6uKRbPtH0JZKMzFxmwaDdKqGLTig8m+5EPob2E9WVYvk
 VO6w4mpupN3rDcFJRFKlg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZDsYPYMkOJM=;xnjsKse1/Iwo7aspvGuMHPwxLQI
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

