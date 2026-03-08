Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E5B21B192;
	Sun,  8 Mar 2026 00:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772929540; cv=none; b=kLtbMRTpsbeZfJ7U9It3QrhlrDv13CWdqjz3B/o3NeGJNpsVYP9vJzgx5x1SrPPSmKzxaPE3HVhY8ap5vczhHXSQBgtj5DEJGxJIFzdXEhrYd47FePIwkRho1XmnQGs0dd+P1vGfVtHrPTzs665n/CRkqTTCeKoGdhb97mKubAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772929540; c=relaxed/simple;
	bh=iPCUkxzT1pgRAs55EHDRcdwaaj7ZNbWDMLDA1ox4Qpk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n7Af2hrWHZLCghcKS2G4BxyXes8lljOSdN8ngWXvsS1BWaj1V5bs4BlfQXKdIzunSsNCs1UnIqldBmsFvQGZd9Qk0b5oLcuQSj9ZUJKSZ0goknfQaGOO1bHgrTRgu0P2+MQfAjXXYM2xgQF1PiGTHAntys70p1pksVVLiBi59co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=EPJ3UOEs; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="EPJ3UOEs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1772929535; x=1773534335; i=w_armin@gmx.de;
	bh=9yYEAN8R/q+eJ/epVkmHeoIfIOY6a1BOEdI7zdNvdbE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=EPJ3UOEs/ApX2STTQ0Ly3ynaoaWMZ/eCUAKyEgnLxqLauJwZey/b8ejotNzmOllP
	 qfUcv3atTsVFqhsTw5s+jB3yDsceHC2GNL4B2yDReXFba8l/1zYQDy7qb+c1qKkqh
	 BKEtkafjj60wv2GXSP0iYZcTefr4e0bZ/1w+HO+oXL7AxnpbYifiXWxV39BDo6U66
	 oN09zX7iS6ifCpFtUje/RMNrT5burDOHd+Ki3NkF8ZOkLV42Nw4a3OQLfmjm9KV4j
	 C22RfqxRHLwu2r69Ru8V4EIkchqsTmybn+niW2RhAI97aG/o1fTbwMQy0OVh/RWkN
	 gSvNPrzYQfJEp9tmxQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MVvPJ-1w6yQF36E1-00MPGA; Sun, 08
 Mar 2026 01:25:34 +0100
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
Subject: [PATCH 5/9] platform/x86: dell-ddv: Use new buffer-based WMI API
Date: Sun,  8 Mar 2026 01:25:18 +0100
Message-Id: <20260308002522.4185-6-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260308002522.4185-1-W_Armin@gmx.de>
References: <20260308002522.4185-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QOaHDdaASEvtIRIk5wBOip189o5TQqFAhRDsbrdsmWJ9BTPMPAB
 +AHwOsTB0t9vENlc2/tydswedAMSgBhxb/wzsMwefPUWnroTuApZ1bKozzjixNwb0D0kowA
 nyBXEqUWNYflfjBQUfa7Q9mq13N5GS8lR1j5tqDa64uKQA9vBHAeFnNXWEfm/N+JuRgP1V7
 Nj/TqcBGumPr0cLG9cFKA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:IuDaoCC5aSk=;xlRfaNLcVORZf8FEzpovI1swJQe
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

