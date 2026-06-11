Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CE035504D;
	Thu, 11 Jun 2026 15:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781190425; cv=none; b=ZfeEvvbsEtWvNJCw842zzs5v1jo9Yt+yc5vWl7k7kq1LSgQT5Qbvvk7gu86jQXkJchanm+EeabtkPy8Jda1decBxumAqsAsPH+m9BgV48uXOqzdjjqXx1r14PUUFL9whCqBILCSup92ZbGg1fRnRChoOaAKjBpvtGSjtJh1+OJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781190425; c=relaxed/simple;
	bh=i4CWQajNHqIOGNkaC0Zhs4rHFeqjSb4G8YxtwjgE9Xg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FLDig3C5TNcDq6t56DFkcF3SK6j+gvfXBzGeSrmArboG86Cm4OKvAD7zAz1o1Tfp7GwtIewu91kL6B/7DidmKttS/2E+NhOXSA8+hc7D8LrkWkmFokIHyAXHc6GIMvTxeyZpjpy2hvt3t617etSj9X97iQHSx0dBi3bfBynOo2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Mr+o9dxX; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Mr+o9dxX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1781190415; x=1781795215; i=w_armin@gmx.de;
	bh=hQ0yydhXllQpJbMULI+6iLy25+n88rCdRbGFhus31Ao=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Mr+o9dxXqZbNiIscFfZaW9Lez0PNfJgFXCfGOVzEGpH8H++vRd1IlJNbkBGWm3T1
	 05Wu44WsmdnhegTDSGlP5qvd2xgvQDwlQXU0dzb2ejaPxmF9ZuE3rWOtqkOQiKEiB
	 918M93ixnyJJM6MPm28/Vc+FeWQ1ZUq0lGFf6hcKtKITOssyPn6ZyANDvD7Qkzz5c
	 c1lsm3tuzIw8kKCngu800Kwp+Q+zaOvFTeyQIZ3yOtS+j5Oc5AikQxUa/CsYCrmXc
	 tqibAUIb2BCMV4enAR7N/CiKoKqRoavDXvQzmxNR44L4jlgP/h/5c2mbs7N6cOelX
	 T9Oxp84gumupMFX5mQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MKsjH-1woNrX46Q9-00Hm8l; Thu, 11
 Jun 2026 17:06:55 +0200
Message-ID: <8f18a426-a71d-4073-bd8b-ff8f9af76c8b@gmx.de>
Date: Thu, 11 Jun 2026 17:06:52 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/9] platform/x86: dell-ddv: Use new buffer-based WMI
 API
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Dell.Client.Kernel@dell.com, pali@kernel.org, mjg59@srcf.ucam.org,
 soyer@irl.hu, Hans de Goede <hansg@kernel.org>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux@roeck-us.net, linux-hwmon@vger.kernel.org, mario.limonciello@amd.com
References: <20260610203453.816254-1-W_Armin@gmx.de>
 <20260610203453.816254-6-W_Armin@gmx.de>
 <a283a0a2-f897-ae2e-7588-819583edc1d3@linux.intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <a283a0a2-f897-ae2e-7588-819583edc1d3@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:c9LP4HzWrjKCVPoyxUHA5mA3c3FvxuGRZZVbeMUC3DzfASBzR9r
 WKzM6fvsY2/7n+D5ncE/o4hHQg9y8urfdd5YsemC0W5jvnlM3idxYuUsvD1hhOMec41XlhN
 ynRXNRayeoyFlr+7cTQejzDZDQKD8eegKKXHQBGMxdI1xFx68Trj2SCk+IHaUG4fDv1q4ov
 /LXog5wA5e1xu+Cevt2KQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3ncoGx/dTrE=;+u00CkRrHbprUlV3v+5lBI4rs7Q
 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

Am 11.06.26 um 15:39 schrieb Ilpo J=C3=A4rvinen:
> On Wed, 10 Jun 2026, Armin Wolf wrote:
>=20
>> Use the new buffer-based WMI API to also support ACPI firmware
>> implementations that do not use ACPI intergers/strings/packages
>> for exchanging data.
>>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   drivers/platform/x86/dell/dell-wmi-ddv.c | 179 +++++++++++-----------=
-
>>   1 file changed, 85 insertions(+), 94 deletions(-)
>>
>> diff --git a/drivers/platform/x86/dell/dell-wmi-ddv.c b/drivers/platfor=
m/x86/dell/dell-wmi-ddv.c
>> index 62e3d060f038..736d9b1fdcfb 100644
>> --- a/drivers/platform/x86/dell/dell-wmi-ddv.c
>> +++ b/drivers/platform/x86/dell/dell-wmi-ddv.c
>> @@ -7,8 +7,9 @@
>>  =20
>>   #define pr_format(fmt) KBUILD_MODNAME ": " fmt
>>  =20
>> -#include <linux/acpi.h>
>>   #include <linux/bitfield.h>
>> +#include <linux/cleanup.h>
>> +#include <linux/compiler_attributes.h>
>>   #include <linux/debugfs.h>
>>   #include <linux/device.h>
>>   #include <linux/device/driver.h>
>> @@ -99,6 +100,11 @@ enum dell_ddv_method {
>>   	DELL_DDV_THERMAL_SENSOR_INFORMATION	=3D 0x22,
>>   };
>>  =20
>> +struct dell_wmi_buffer {
>> +	__le32 raw_size;
>> +	u8 raw_data[];
>> +} __packed;
>> +
>>   struct fan_sensor_entry {
>>   	u8 type;
>>   	__le16 rpm;
>> @@ -126,7 +132,7 @@ struct dell_wmi_ddv_sensors {
>>   	bool active;
>>   	struct mutex lock;	/* protect caching */
>>   	unsigned long timestamp;
>> -	union acpi_object *obj;
>> +	struct dell_wmi_buffer *buffer;
>>   	u64 entries;
>>   };
>>  =20
>> @@ -158,105 +164,96 @@ static const char * const fan_dock_labels[] =3D =
{
>>   	"Docking Chipset Fan",
>>   };
>>  =20
>> -static int dell_wmi_ddv_query_type(struct wmi_device *wdev, enum dell_=
ddv_method method, u32 arg,
>> -				   union acpi_object **result, acpi_object_type type)
>> +static int dell_wmi_ddv_query(struct wmi_device *wdev, enum dell_ddv_m=
ethod method, u32 arg,
>> +			      struct wmi_buffer *output, size_t min_size)
>>   {
>> -	struct acpi_buffer out =3D { ACPI_ALLOCATE_BUFFER, NULL };
>> -	const struct acpi_buffer in =3D {
>> -		.length =3D sizeof(arg),
>> -		.pointer =3D &arg,
>> +	__le32 arg2 =3D cpu_to_le32(arg);
>> +	const struct wmi_buffer input =3D {
>> +		.length =3D sizeof(arg2),
>> +		.data =3D &arg2,
>>   	};
>> -	union acpi_object *obj;
>> -	acpi_status ret;
>> -
>> -	ret =3D wmidev_evaluate_method(wdev, 0x0, method, &in, &out);
>> -	if (ACPI_FAILURE(ret))
>> -		return -EIO;
>> -
>> -	obj =3D out.pointer;
>> -	if (!obj)
>> -		return -ENODATA;
>> -
>> -	if (obj->type !=3D type) {
>> -		kfree(obj);
>> -		return -ENOMSG;
>> -	}
>> -
>> -	*result =3D obj;
>>  =20
>> -	return 0;
>> +	return wmidev_invoke_method(wdev, 0x0, method, &input, output, min_si=
ze);
>>   }
>>  =20
>>   static int dell_wmi_ddv_query_integer(struct wmi_device *wdev, enum d=
ell_ddv_method method,
>>   				      u32 arg, u32 *res)
>>   {
>> -	union acpi_object *obj;
>> +	struct wmi_buffer output;
>>   	int ret;
>>  =20
>> -	ret =3D dell_wmi_ddv_query_type(wdev, method, arg, &obj, ACPI_TYPE_IN=
TEGER);
>> +	ret =3D dell_wmi_ddv_query(wdev, method, arg, &output, sizeof(__le32)=
);
>>   	if (ret < 0)
>>   		return ret;
>>  =20
>> -	if (obj->integer.value <=3D U32_MAX)
>> -		*res =3D (u32)obj->integer.value;
>> -	else
>> -		ret =3D -ERANGE;
>> +	__le32 *argr __free(kfree) =3D output.data;
>>  =20
>> -	kfree(obj);
>> +	*res =3D le32_to_cpu(*argr);
>>  =20
>> -	return ret;
>> +	return 0;
>>   }
>>  =20
>>   static int dell_wmi_ddv_query_buffer(struct wmi_device *wdev, enum de=
ll_ddv_method method,
>> -				     u32 arg, union acpi_object **result)
>> +				     u32 arg, struct dell_wmi_buffer **result)
>>   {
>> -	union acpi_object *obj;
>> -	u64 buffer_size;
>> +	struct dell_wmi_buffer *buffer;
>> +	struct wmi_buffer output;
>> +	size_t buffer_size;
>>   	int ret;
>>  =20
>> -	ret =3D dell_wmi_ddv_query_type(wdev, method, arg, &obj, ACPI_TYPE_PA=
CKAGE);
>> +	ret =3D dell_wmi_ddv_query(wdev, method, arg, &output, sizeof(*buffer=
));
>>   	if (ret < 0)
>>   		return ret;
>>  =20
>> -	if (obj->package.count !=3D 2 ||
>> -	    obj->package.elements[0].type !=3D ACPI_TYPE_INTEGER ||
>> -	    obj->package.elements[1].type !=3D ACPI_TYPE_BUFFER) {
>> -		ret =3D -ENOMSG;
>> -
>> -		goto err_free;
>> -	}
>> -
>> -	buffer_size =3D obj->package.elements[0].integer.value;
>> -
>> -	if (!buffer_size) {
>> +	buffer =3D output.data;
>> +	if (!le32_to_cpu(buffer->raw_size)) {
>>   		ret =3D -ENODATA;
>>  =20
>>   		goto err_free;
>>   	}
>>  =20
>> -	if (buffer_size > obj->package.elements[1].buffer.length) {
>> +	buffer_size =3D struct_size(buffer, raw_data, le32_to_cpu(buffer->raw=
_size));
>> +	if (buffer_size > output.length) {
>>   		dev_warn(&wdev->dev,
>> -			 FW_WARN "WMI buffer size (%llu) exceeds ACPI buffer size (%d)\n",
>> -			 buffer_size, obj->package.elements[1].buffer.length);
>> +			 FW_WARN "Dell WMI buffer size (%zu) exceeds WMI buffer size (%zu)\=
n",
>> +			 buffer_size, output.length);
>>   		ret =3D -EMSGSIZE;
>>  =20
>>   		goto err_free;
>>   	}
>>  =20
>> -	*result =3D obj;
>> +	*result =3D buffer;
>=20
> This could use __free() and no_free_ptr() to simplify the code flow.

Nice, i did not know about no_free_ptr(). I will include this in the=20
next revision.

>=20
>>  =20
>>   	return 0;
>>  =20
>>   err_free:
>> -	kfree(obj);
>> +	kfree(output.data);
>>  =20
>>   	return ret;
>>   }
>>  =20
>> -static int dell_wmi_ddv_query_string(struct wmi_device *wdev, enum del=
l_ddv_method method,
>> -				     u32 arg, union acpi_object **result)
>> +static ssize_t dell_wmi_ddv_query_string(struct wmi_device *wdev, enum=
 dell_ddv_method method,
>> +					 u32 arg, char *buf, size_t length)
>>   {
>> -	return dell_wmi_ddv_query_type(wdev, method, arg, result, ACPI_TYPE_S=
TRING);
>> +	struct wmi_buffer output;
>> +	size_t str_size;
>> +	int ret;
>> +
>> +	ret =3D dell_wmi_ddv_query(wdev, method, arg, &output, sizeof(struct =
wmi_string));
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	struct wmi_string *str __free(kfree) =3D output.data;
>> +
>> +	str_size =3D sizeof(*str) + le16_to_cpu(str->length);
>> +	if (str_size > output.length) {
>> +		dev_warn(&wdev->dev,
>> +			 FW_WARN "WMI string size (%zu) exceeds WMI buffer size (%zu)\n",
>> +			 str_size, output.length);
>> +		return -EMSGSIZE;
>> +	}
>> +
>> +	return wmi_string_to_utf8s(str, buf, length);
>>   }
>>  =20
>>   /*
>> @@ -265,28 +262,26 @@ static int dell_wmi_ddv_query_string(struct wmi_d=
evice *wdev, enum dell_ddv_meth
>>   static int dell_wmi_ddv_update_sensors(struct wmi_device *wdev, enum =
dell_ddv_method method,
>>   				       struct dell_wmi_ddv_sensors *sensors, size_t entry_size)
>>   {
>> +	struct dell_wmi_buffer *buffer;
>>   	u64 buffer_size, rem, entries;
>> -	union acpi_object *obj;
>> -	u8 *buffer;
>>   	int ret;
>>  =20
>> -	if (sensors->obj) {
>> +	if (sensors->buffer) {
>>   		if (time_before(jiffies, sensors->timestamp + HZ))
>>   			return 0;
>>  =20
>> -		kfree(sensors->obj);
>> -		sensors->obj =3D NULL;
>> +		kfree(sensors->buffer);
>> +		sensors->buffer =3D NULL;
>>   	}
>>  =20
>> -	ret =3D dell_wmi_ddv_query_buffer(wdev, method, 0, &obj);
>> +	ret =3D dell_wmi_ddv_query_buffer(wdev, method, 0, &buffer);
>>   	if (ret < 0)
>>   		return ret;
>>  =20
>>   	/* buffer format sanity check */
>> -	buffer_size =3D obj->package.elements[0].integer.value;
>> -	buffer =3D obj->package.elements[1].buffer.pointer;
>> +	buffer_size =3D le32_to_cpu(buffer->raw_size);
>>   	entries =3D div64_u64_rem(buffer_size, entry_size, &rem);
>> -	if (rem !=3D 1 || buffer[buffer_size - 1] !=3D 0xff) {
>> +	if (rem !=3D 1 || buffer->raw_data[buffer_size - 1] !=3D 0xff) {
>>   		ret =3D -ENOMSG;
>>   		goto err_free;
>>   	}
>> @@ -296,14 +291,14 @@ static int dell_wmi_ddv_update_sensors(struct wmi=
_device *wdev, enum dell_ddv_me
>>   		goto err_free;
>>   	}
>>  =20
>> -	sensors->obj =3D obj;
>> +	sensors->buffer =3D buffer;
>>   	sensors->entries =3D entries;
>>   	sensors->timestamp =3D jiffies;
>>  =20
>>   	return 0;
>>  =20
>>   err_free:
>> -	kfree(obj);
>> +	kfree(buffer);
>>  =20
>>   	return ret;
>>   }
>> @@ -328,7 +323,7 @@ static int dell_wmi_ddv_fan_read_channel(struct del=
l_wmi_ddv_data *data, u32 att
>>   	if (channel >=3D data->fans.entries)
>>   		return -ENXIO;
>>  =20
>> -	entry =3D (struct fan_sensor_entry *)data->fans.obj->package.elements=
[1].buffer.pointer;
>> +	entry =3D (struct fan_sensor_entry *)data->fans.buffer->raw_data;
>>   	switch (attr) {
>>   	case hwmon_fan_input:
>>   		*val =3D get_unaligned_le16(&entry[channel].rpm);
>> @@ -354,7 +349,7 @@ static int dell_wmi_ddv_temp_read_channel(struct de=
ll_wmi_ddv_data *data, u32 at
>>   	if (channel >=3D data->temps.entries)
>>   		return -ENXIO;
>>  =20
>> -	entry =3D (struct thermal_sensor_entry *)data->temps.obj->package.ele=
ments[1].buffer.pointer;
>> +	entry =3D (struct thermal_sensor_entry *)data->temps.buffer->raw_data=
;
>>   	switch (attr) {
>>   	case hwmon_temp_input:
>>   		*val =3D entry[channel].now * 1000;
>> @@ -411,7 +406,7 @@ static int dell_wmi_ddv_fan_read_string(struct dell=
_wmi_ddv_data *data, int chan
>>   	if (channel >=3D data->fans.entries)
>>   		return -ENXIO;
>>  =20
>> -	entry =3D (struct fan_sensor_entry *)data->fans.obj->package.elements=
[1].buffer.pointer;
>> +	entry =3D (struct fan_sensor_entry *)data->fans.buffer->raw_data;
>>   	type =3D entry[channel].type;
>>   	switch (type) {
>>   	case 0x00 ... 0x07:
>> @@ -442,7 +437,7 @@ static int dell_wmi_ddv_temp_read_string(struct del=
l_wmi_ddv_data *data, int cha
>>   	if (channel >=3D data->temps.entries)
>>   		return -ENXIO;
>>  =20
>> -	entry =3D (struct thermal_sensor_entry *)data->temps.obj->package.ele=
ments[1].buffer.pointer;
>> +	entry =3D (struct thermal_sensor_entry *)data->temps.buffer->raw_data=
;
>>   	switch (entry[channel].type) {
>>   	case 0x00:
>>   		*str =3D "CPU";
>> @@ -553,8 +548,8 @@ static void dell_wmi_ddv_hwmon_cache_invalidate(str=
uct dell_wmi_ddv_sensors *sen
>>   		return;
>>  =20
>>   	mutex_lock(&sensors->lock);
>> -	kfree(sensors->obj);
>> -	sensors->obj =3D NULL;
>> +	kfree(sensors->buffer);
>> +	sensors->buffer =3D NULL;
>>   	mutex_unlock(&sensors->lock);
>>   }
>>  =20
>> @@ -564,7 +559,7 @@ static void dell_wmi_ddv_hwmon_cache_destroy(void *=
data)
>>  =20
>>   	sensors->active =3D false;
>>   	mutex_destroy(&sensors->lock);
>> -	kfree(sensors->obj);
>> +	kfree(sensors->buffer);
>>   }
>>  =20
>>   static struct hwmon_channel_info *dell_wmi_ddv_channel_init(struct wm=
i_device *wdev,
>> @@ -750,7 +745,7 @@ static void dell_wmi_battery_invalidate(struct dell=
_wmi_ddv_data *data,
>>   static ssize_t eppid_show(struct device *dev, struct device_attribute=
 *attr, char *buf)
>>   {
>>   	struct dell_wmi_ddv_data *data =3D container_of(attr, struct dell_wm=
i_ddv_data, eppid_attr);
>> -	union acpi_object *obj;
>> +	ssize_t count;
>>   	u32 index;
>>   	int ret;
>>  =20
>> @@ -758,19 +753,19 @@ static ssize_t eppid_show(struct device *dev, str=
uct device_attribute *attr, cha
>>   	if (ret < 0)
>>   		return ret;
>>  =20
>> -	ret =3D dell_wmi_ddv_query_string(data->wdev, DELL_DDV_BATTERY_EPPID,=
 index, &obj);
>> -	if (ret < 0)
>> -		return ret;
>> -
>> -	if (obj->string.length !=3D DELL_EPPID_LENGTH && obj->string.length !=
=3D DELL_EPPID_EXT_LENGTH)
>> -		dev_info_once(&data->wdev->dev, FW_INFO "Suspicious ePPID length (%d=
)\n",
>> -			      obj->string.length);
>> +	count =3D dell_wmi_ddv_query_string(data->wdev, DELL_DDV_BATTERY_EPPI=
D, index, buf,
>> +					  PAGE_SIZE);
>> +	if (count < 0)
>> +		return count;
>>  =20
>> -	ret =3D sysfs_emit(buf, "%s\n", obj->string.pointer);
>> +	if (count !=3D DELL_EPPID_LENGTH && count !=3D DELL_EPPID_EXT_LENGTH)
>> +		dev_info_once(&data->wdev->dev, FW_INFO "Suspicious ePPID length (%z=
d)\n", count);
>>  =20
>> -	kfree(obj);
>> +	ret =3D sysfs_emit_at(buf, count, "\n");
>=20
> What's going on with this change? I see it printing nothing but a newlin=
e
> character anymore?

dell_wmi_ddv_query_string() fills the buffer with the decoded WMI=20
string, we just need to append the newline character here.

I tested this on my (by now old) Dell device and it worked flawlessly.

Thanks,
Armin Wolf

>=20
> --
>   i.
>=20
>> +	if (ret < 0)
>> +		return ret;
>>  =20
>> -	return ret;
>> +	return count + ret;
>>   }
>>  =20
>>   static int dell_wmi_ddv_get_health(struct dell_wmi_ddv_data *data, u3=
2 index,
>> @@ -994,19 +989,15 @@ static int dell_wmi_ddv_buffer_read(struct seq_fi=
le *seq, enum dell_ddv_method m
>>   {
>>   	struct device *dev =3D seq->private;
>>   	struct dell_wmi_ddv_data *data =3D dev_get_drvdata(dev);
>> -	union acpi_object *obj;
>> -	u64 size;
>> -	u8 *buf;
>> +	struct dell_wmi_buffer *buffer;
>>   	int ret;
>>  =20
>> -	ret =3D dell_wmi_ddv_query_buffer(data->wdev, method, 0, &obj);
>> +	ret =3D dell_wmi_ddv_query_buffer(data->wdev, method, 0, &buffer);
>>   	if (ret < 0)
>>   		return ret;
>>  =20
>> -	size =3D obj->package.elements[0].integer.value;
>> -	buf =3D obj->package.elements[1].buffer.pointer;
>> -	ret =3D seq_write(seq, buf, size);
>> -	kfree(obj);
>> +	ret =3D seq_write(seq, buffer->raw_data, le32_to_cpu(buffer->raw_size=
));
>> +	kfree(buffer);
>>  =20
>>   	return ret;
>>   }
>>
>=20

