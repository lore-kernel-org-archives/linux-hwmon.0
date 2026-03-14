Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A2B339861;
	Sat, 14 Mar 2026 17:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773510817; cv=none; b=pRc+AlMBEGNBCbYNMXrXCHS4rIb2lDWM+nJpo2nMhu1Zz06aS8URLrTh89VIa+VMoIZmPEZ8lbNGLEaL/jYE21O5f6cBKuyxyxgNsIxJqtxBa8SF3iaOeyXLc9bjn3XsO6+lXFFhDVMCJcKX50d+eeGHFlcRIH5iMC5VYDMDbhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773510817; c=relaxed/simple;
	bh=iPCUkxzT1pgRAs55EHDRcdwaaj7ZNbWDMLDA1ox4Qpk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e7bDdF3G/BKjCNmfcOnRjFmjEuoGFyGGg5iW6WnwQOh2Pok+HSW582fDQ2eVUj+3Yu13mNB00M/uGmMiZMLylWSOhHiJR4LcDx0p/9LDFiVanyUTm86yFRQcUXRBa9oUT7iPe6P4GzZQPiSQHpnlNEDPB8r990rR3QZDmINIv8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=arolTl+4; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="arolTl+4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1773510789; x=1774115589; i=w_armin@gmx.de;
	bh=9yYEAN8R/q+eJ/epVkmHeoIfIOY6a1BOEdI7zdNvdbE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=arolTl+4QoHs88kl8kzDBQLH0A8mQf74SJT5Lb7N++0uX1xVORwMnxwgwOzGYxxo
	 lgMn2CiqERYgHqvD/YR0S3kpklnjxoU65DD3FczlHuoqzQjBLdovP4qw0C4CbrwU5
	 KnpEZujqBbHCp2wu8vlEz9rHLyTUAuHQs+Ae4+69DR3cw65EJIs0SbDsvV07vkyWy
	 KjzD53ijN3jD8XcgZsnSi0BUuHO1B0kJ6r/K+DREWvopyoy0Iqc6km7c2X09ivv79
	 +pXSd6/iNSnwPfwZsoPOj/CpyPmWG1T7QK9xvGN4OYfR4zp/LzzlF8W4O5MzkRwvP
	 qFg7hZGxCAewu9EhEQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MuDXz-1vkdmC2b9R-00une9; Sat, 14
 Mar 2026 18:53:09 +0100
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
Subject: [PATCH v3 5/9] platform/x86: dell-ddv: Use new buffer-based WMI API
Date: Sat, 14 Mar 2026 18:52:45 +0100
Message-Id: <20260314175249.16040-6-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260314175249.16040-1-W_Armin@gmx.de>
References: <20260314175249.16040-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1p4i88IXXa4BCSXE+dfW/ErJS2nRzJcPAIlEVBJ8aD8R5Nhi+u/
 YjILrTkl5VNvhDn6QoahjEchbN0C9c2OH0fvbOMYTb2uW60SqYEV2JB44yrrZAh0Rc0KJTA
 EBVA6bUXqsbAtxUE5iRbm2hNgGGFYL8WqbLNEL3NOhYIArSt2wp//TbG56JBVSNn8dwUqg9
 32YTjC2WLDRCk/gvPerlg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zxtLAzgIzfE=;DGbdRO96syyauDGHTmGdev+TyUU
 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
 nz

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

