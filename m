Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDC0331203;
	Tue, 31 Mar 2026 19:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774986869; cv=none; b=iZetX3w/T4a0NC99boMVkLiPi128uCUYNsFXiFUQRslcQsJ3ze6Pwr/t/j7cKNuzG9EOO4QZcjYbDM1AWOx5uqVJzxMmNjRixTxDZKhpET06xg1NpYBLMpPGIOKiXQU1p+cRnWFoQsQimHu5ruqHVTOBbqwKkCZg44FYqoasGrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774986869; c=relaxed/simple;
	bh=D6IPpfKCYY/NxCRyIJObg6r0UoNvWdAE52CA8fhkTM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aUE7wOBiSOPciNaRgxVVFGxmuewCdJPKmWIJJWa76dGVgDeNOEXq55urwbOjOHSFz0rt6hg/KtdHz3ZkwYP8ol2kIcbgEr9LktTH101EgRpZ2kYCW6Vo0SXzq3DlN56L5t7NLtZqxZn1M6Yz64MxosJ7xlbj/dKbmi7thUyOJ7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=lmX0bMjx; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="lmX0bMjx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1774986840; x=1775591640; i=w_armin@gmx.de;
	bh=HJLmI4NnzuS1HrpkF5XD0871DkY9jnL4fM3wC8qxvzY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=lmX0bMjx1gOcAUKqTCxziWvq/ObBUB2g8qOMR6nICwWfr2HYG17e7CHBKHGi4271
	 eIu5oxHNT9lQnYKPvjUSXf15rSi0AuUe/LCoqjhHAdAJuZMCJ7J32pVHBmM4gnAdn
	 rANB1uUjm9JsaqVRPVMZwREm6xamplfXDZviIQtJI0U1ZxtP6Qdz8G/YlEH5AVOY9
	 q8e+2Nfdb/l1IXG76Q1w5gKsxt9jRQ9vrjO4zKiZSLI7GrgNitnDqGulUC782x5HV
	 FUXPNef5EZqfnlhEIcbj9jnJMjL+qLoKJ6OBPJVswTjt4TOON1xoX9XVExlAsd842
	 YdwG72X2R6Uq3Hon/Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mt75H-1vF9pR1SUT-00vZAH; Tue, 31
 Mar 2026 21:54:00 +0200
Message-ID: <8e7b4245-d8af-48ad-832e-1e25d441f74b@gmx.de>
Date: Tue, 31 Mar 2026 21:53:56 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] platform/x86: dell-descriptor: Use new
 buffer-based WMI API
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Dell.Client.Kernel@dell.com, pali@kernel.org, mjg59@srcf.ucam.org,
 soyer@irl.hu, Hans de Goede <hansg@kernel.org>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux@roeck-us.net, linux-hwmon@vger.kernel.org, mario.limonciello@amd.com
References: <20260314175249.16040-1-W_Armin@gmx.de>
 <20260314175249.16040-2-W_Armin@gmx.de>
 <0020b3ec-e095-3736-413e-84f08dbcff93@linux.intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <0020b3ec-e095-3736-413e-84f08dbcff93@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xL2mT/ay5Ol3rf4U3SpdK34Fw6bjDKTCfBsdUn61ecCb1y6LALQ
 DVREOLQHwV1Bv8ew5yxQ91zUAshpmXcotPJ15M6wajhWB5YTe4l/flMVMM/RfbAeeQtJSTa
 y197XHJRgzO55pnvil8Kw2tG/C6R4nxNDSkpHqcf+jx4bL7cmb1tqM0VTkOZ07PT3vCfVoU
 eOR1C92SJY65MmC2JZwGQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Riv2jECrz2E=;ulIcC/UCrausWr2czfj0+XkwWDM
 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
 lb8/aOyIWo1j+eHe+V9zKsgA==

Am 31.03.26 um 11:00 schrieb Ilpo J=C3=A4rvinen:

> On Sat, 14 Mar 2026, Armin Wolf wrote:
>
>> Use the new buffer-based WMI API to also support ACPI firmware
>> implementations that do not use ACPI buffers for the descriptor.
>>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   .../platform/x86/dell/dell-wmi-descriptor.c   | 94 +++++++++---------=
-
>>   1 file changed, 47 insertions(+), 47 deletions(-)
>>
>> diff --git a/drivers/platform/x86/dell/dell-wmi-descriptor.c b/drivers/=
platform/x86/dell/dell-wmi-descriptor.c
>> index c2a180202719..fe42eb8bbd79 100644
>> --- a/drivers/platform/x86/dell/dell-wmi-descriptor.c
>> +++ b/drivers/platform/x86/dell/dell-wmi-descriptor.c
>> @@ -7,7 +7,7 @@
>>  =20
>>   #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>>  =20
>> -#include <linux/acpi.h>
>> +#include <linux/compiler_attributes.h>
>>   #include <linux/list.h>
>>   #include <linux/module.h>
>>   #include <linux/wmi.h>
>> @@ -15,6 +15,24 @@
>>  =20
>>   #define DELL_WMI_DESCRIPTOR_GUID "8D9DDCBC-A997-11DA-B012-B622A1EF549=
2"
>>  =20
>> +/*
>> + * Descriptor buffer is 128 byte long and contains:
>> + *
>> + *       Name             Offset  Length  Value
>> + * Vendor Signature          0       4    "DELL"
>> + * Object Signature          4       4    " WMI"
>> + * WMI Interface Version     8       4    <version>
>> + * WMI buffer length        12       4    <length>
>> + * WMI hotfix number        16       4    <hotfix>
>> + */
>> +struct descriptor {
>> +	char vendor_signature[4];
>> +	char object_signature[4];
>> +	__le32 interface_version;
>> +	__le32 buffer_length;
>> +	__le32 hotfix_number;
>> +} __packed;
>> +
>>   struct descriptor_priv {
>>   	struct list_head list;
>>   	u32 interface_version;
>> @@ -88,76 +106,58 @@ bool dell_wmi_get_hotfix(u32 *hotfix)
>>   }
>>   EXPORT_SYMBOL_GPL(dell_wmi_get_hotfix);
>>  =20
>> -/*
>> - * Descriptor buffer is 128 byte long and contains:
>> - *
>> - *       Name             Offset  Length  Value
>> - * Vendor Signature          0       4    "DELL"
>> - * Object Signature          4       4    " WMI"
>> - * WMI Interface Version     8       4    <version>
>> - * WMI buffer length        12       4    <length>
>> - * WMI hotfix number        16       4    <hotfix>
>> - */
>> -static int dell_wmi_descriptor_probe(struct wmi_device *wdev,
>> -				     const void *context)
>> +static int dell_wmi_descriptor_probe(struct wmi_device *wdev, const vo=
id *context)
>>   {
>> -	union acpi_object *obj =3D NULL;
>>   	struct descriptor_priv *priv;
>> -	u32 *buffer;
>> +	struct wmi_buffer buffer;
>> +	struct descriptor *desc;
>>   	int ret;
>>  =20
>> -	obj =3D wmidev_block_query(wdev, 0);
>> -	if (!obj) {
>> -		dev_err(&wdev->dev, "failed to read Dell WMI descriptor\n");
>> -		ret =3D -EIO;
>> -		goto out;
>> -	}
>> +	ret =3D wmidev_query_block(wdev, 0, &buffer);
>> +	if (ret < 0)
>> +		return ret;
>>  =20
>> -	if (obj->type !=3D ACPI_TYPE_BUFFER) {
>> -		dev_err(&wdev->dev, "Dell descriptor has wrong type\n");
>> +	if (buffer.length < sizeof(*desc)) {
>> +		dev_err(&wdev->dev,
>> +			"Dell descriptor buffer contains not enough data (%zu)\n",
> This word order sounds odd to me. I'd say:
>
> Dell descriptor buffer does not contain ...

Ok.

>> +			buffer.length);
>>   		ret =3D -EINVAL;
>>   		descriptor_valid =3D ret;
>>   		goto out;
>>   	}
>>  =20
>> -	/* Although it's not technically a failure, this would lead to
>> -	 * unexpected behavior
>> -	 */
>> -	if (obj->buffer.length !=3D 128) {
>> -		dev_err(&wdev->dev,
>> -			"Dell descriptor buffer has unexpected length (%d)\n",
>> -			obj->buffer.length);
>> -		ret =3D -EINVAL;
>> +	desc =3D buffer.data;
> I think these should be moving towards using __free() so we could remove
> those gotos to kfree(). This applies to many changes in this series. Som=
e
> may need a local variable to be introduced (here we've 'desc' already so
> it's very easy in this case).
>
> I'm fine if you want to do __free() changes in a patch separate from
> this wmi conversion but we should aim to make these follow best practice=
s
> so that others pick the preferred patterns more easily.

Ok, i will resend the series with the necessary changes.

Thanks,
Armin Wolf

>> +	if (strncmp(desc->vendor_signature, "DELL", sizeof(desc->vendor_signa=
ture))) {
>> +		dev_err(&wdev->dev, "Dell descriptor buffer has invalid vendor signa=
ture (%4ph)\n",
>> +			desc->vendor_signature);
>> +		ret =3D -ENOMSG;
>>   		descriptor_valid =3D ret;
>>   		goto out;
>>   	}
>>  =20
>> -	buffer =3D (u32 *)obj->buffer.pointer;
>> -
>> -	if (strncmp(obj->string.pointer, "DELL WMI", 8) !=3D 0) {
>> -		dev_err(&wdev->dev, "Dell descriptor buffer has invalid signature (%=
8ph)\n",
>> -			buffer);
>> -		ret =3D -EINVAL;
>> +	if (strncmp(desc->object_signature, " WMI", sizeof(desc->vendor_signa=
ture))) {
>> +		dev_err(&wdev->dev, "Dell descriptor buffer has invalid object signa=
ture (%4ph)\n",
>> +			desc->object_signature);
>> +		ret =3D -ENOMSG;
>>   		descriptor_valid =3D ret;
>>   		goto out;
>>   	}
>>   	descriptor_valid =3D 0;
>>  =20
>> -	if (buffer[2] !=3D 0 && buffer[2] !=3D 1)
>> -		dev_warn(&wdev->dev, "Dell descriptor buffer has unknown version (%l=
u)\n",
>> -			(unsigned long) buffer[2]);
>> -
>> -	priv =3D devm_kzalloc(&wdev->dev, sizeof(struct descriptor_priv),
>> -	GFP_KERNEL);
>> +	if (le32_to_cpu(desc->interface_version) > 2)
>> +		dev_warn(&wdev->dev, "Dell descriptor buffer has unknown version (%u=
)\n",
>> +			 le32_to_cpu(desc->interface_version));
>>  =20
>> +	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
>>   	if (!priv) {
>>   		ret =3D -ENOMEM;
>>   		goto out;
>>   	}
>>  =20
>> -	priv->interface_version =3D buffer[2];
>> -	priv->size =3D buffer[3];
>> -	priv->hotfix =3D buffer[4];
>> +	priv->interface_version =3D le32_to_cpu(desc->interface_version);
>> +	priv->size =3D le32_to_cpu(desc->buffer_length);
>> +	priv->hotfix =3D le32_to_cpu(desc->hotfix_number);
>>   	ret =3D 0;
>>   	dev_set_drvdata(&wdev->dev, priv);
>>   	mutex_lock(&list_mutex);
>> @@ -170,7 +170,7 @@ static int dell_wmi_descriptor_probe(struct wmi_dev=
ice *wdev,
>>   		(unsigned long) priv->hotfix);
>>  =20
>>   out:
>> -	kfree(obj);
>> +	kfree(buffer.data);
>>   	return ret;
>>   }
>>  =20
>>
