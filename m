Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF1C32C317;
	Sun,  8 Mar 2026 20:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773000239; cv=none; b=WMqnOEZv8K2MoTr/ZStU3sVIGwT786FsDM5VBjfOI1b3TFtYMxnCtstm9qHd9+EexUIbTmYALqRc6c66qWXVN9OatJkPkrBPqQ9lNR4xQciT4FarTTsgWHGc4cZ9zI0S+4Pzw7Mi+FuVhz0lqyib6GT2Q6IEit0MD0qRHCVTYw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773000239; c=relaxed/simple;
	bh=7Thy/6zYdAH+35aUWDL6oQVcnrqWqg+PocBXSCFy2Wk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dGVBdyuiIsZV54wMtln3MJuB3U65MOQIIgAVsgtK7tqFrqVsQsyQb68gmL/tUglhtRyL+vuHAIInUCp6spW4gUUMrJmQ4nnKbBAl3ndGSUo1Cq+iZrsonuUYcsWFLwJta7UJm+ESc7Z9xunQYvDF+HGT+Fv+UwQlywS7XAxUQBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=RlfUNOnF; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="RlfUNOnF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1773000234; x=1773605034; i=w_armin@gmx.de;
	bh=7Thy/6zYdAH+35aUWDL6oQVcnrqWqg+PocBXSCFy2Wk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=RlfUNOnFXerj/KEEwcfPelvEO00H8uu1O7zw3GJyMVlTxoj56m3Dc0QTVNclWRoW
	 NF+XokwtI/Rng3owp9j+aenrvAQ0fyx4gZlCcR+NkqyxEtfLKYT8cdAO4vurq5RPR
	 lgR3U6ED3CyO8qcMwKNb+FT/Le0RINz8+8ACXzYUfMp7jH+hl3UJSyzmb4mvmle+C
	 A64LM/QL0JKkuWEfhCxiSlfm+PUbwoaezu77mZfo+qf1W7pSRzehb8rTdmxiNkrXA
	 yOEdI46tpC3NxI1TQzAWwiNlpvOtTBSk0rwUK+V1dEpfa4gZetUAtccHOUxS0DVfz
	 Za50ZPOpr72uE09Q9g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MfYLQ-1vSBSk2ozQ-00lRHu; Sun, 08
 Mar 2026 21:03:54 +0100
Message-ID: <376ea58f-98c3-4052-8f07-b0a5b09c6fc6@gmx.de>
Date: Sun, 8 Mar 2026 21:03:51 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] hwmon: (dell-smm) Use new buffer-based WMI API
To: Guenter Roeck <linux@roeck-us.net>, Dell.Client.Kernel@dell.com,
 pali@kernel.org, mjg59@srcf.ucam.org
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org
References: <20260308002522.4185-1-W_Armin@gmx.de>
 <20260308002522.4185-7-W_Armin@gmx.de>
 <26f9b0a7-5404-48b4-a63c-cb61e7f91151@roeck-us.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <26f9b0a7-5404-48b4-a63c-cb61e7f91151@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FbmFrUM2fhNalHR9U+nAYNFhvh96xTmIXGPA3VsZAzn3towzcQJ
 XHtgybsAeXziCXIFtnQyhj3o4cDISjR1wTWiFXGwiwtuzVXoMvTX68UfvprorwYsxX2Im0f
 LNi/9mGXB5yeVOAWwWhEyEzpxPnipmv7XgpucZodHUtPlk0AYFMCXVMDSYEpErPAz0faWds
 /quPNonhUT7u4n1pUrXyA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:urHgXiLus1Q=;pznIYffKRBgCG1VKGSyndoMHxZ+
 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

Am 08.03.26 um 15:52 schrieb Guenter Roeck:

> On 3/7/26 16:25, Armin Wolf wrote:
>> Use the new buffer-based WMI API to also support ACPI firmware
>> implementations that do not use ACPI buffers for returning the
>> results of a SMM call.
>>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>> =C2=A0 drivers/hwmon/dell-smm-hwmon.c | 47 ++++++++++++----------------=
=2D-----
>> =C2=A0 1 file changed, 16 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/hwmon/dell-smm-hwmon.c=20
>> b/drivers/hwmon/dell-smm-hwmon.c
>> index 038edffc1ac7..07c05a82dc26 100644
>> --- a/drivers/hwmon/dell-smm-hwmon.c
>> +++ b/drivers/hwmon/dell-smm-hwmon.c
>> @@ -12,8 +12,9 @@
>> =C2=A0 =C2=A0 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> =C2=A0 -#include <linux/acpi.h>
>> +#include <linux/align.h>
>> =C2=A0 #include <linux/capability.h>
>> +#include <linux/compiler_attributes.h>
>> =C2=A0 #include <linux/cpu.h>
>> =C2=A0 #include <linux/ctype.h>
>> =C2=A0 #include <linux/delay.h>
>> @@ -36,10 +37,10 @@
>> =C2=A0 #include <linux/thermal.h>
>> =C2=A0 #include <linux/types.h>
>> =C2=A0 #include <linux/uaccess.h>
>> +#include <linux/unaligned.h>
>> =C2=A0 #include <linux/wmi.h>
>> =C2=A0 =C2=A0 #include <linux/i8k.h>
>> -#include <linux/unaligned.h>
>> =C2=A0 =C2=A0 #define I8K_SMM_FN_STATUS=C2=A0=C2=A0=C2=A0 0x0025
>> =C2=A0 #define I8K_SMM_POWER_STATUS=C2=A0=C2=A0=C2=A0 0x0069
>> @@ -232,7 +233,7 @@ static const struct dell_smm_ops i8k_smm_ops =3D {
>> =C2=A0 /*
>> =C2=A0=C2=A0 * Call the System Management Mode BIOS over WMI.
>> =C2=A0=C2=A0 */
>> -static ssize_t wmi_parse_register(u8 *buffer, u32 length, unsigned=20
>> int *reg)
>> +static ssize_t wmi_parse_register(void *buffer, size_t length,=20
>> unsigned int *reg)
>
> Later in this function:
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memcpy_and_pad(&value, sizeof=
(value), buffer +=20
> sizeof(reg_size), reg_size, 0);
>
> So the new code relies on pointer arithmetic on void *. This used to=20
> be invalid,
> and it seems fragile.

I see, good catch. I will keep "buffer" as a u8 pointer then.

Thanks,
Armin Wolf

>
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __le32 value;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 reg_size;
>> @@ -253,7 +254,7 @@ static ssize_t wmi_parse_register(u8 *buffer, u32=
=20
>> length, unsigned int *reg)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return reg_size + sizeof(reg_size);
>> =C2=A0 }
>> =C2=A0 -static int wmi_parse_response(u8 *buffer, u32 length, struct=20
>> smm_regs *regs)
>> +static int wmi_parse_response(void *buffer, size_t length, struct=20
>> smm_regs *regs)
>
> Same here.
>
> Given that those are internal functions, I don't really see the point=20
> of changing
> the parameter type.
>
> Thanks,
> Guenter
>
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int *registers[] =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &regs->eax,
>> @@ -261,7 +262,7 @@ static int wmi_parse_response(u8 *buffer, u32=20
>> length, struct smm_regs *regs)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &regs->ecx,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &regs->edx
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>> -=C2=A0=C2=A0=C2=A0 u32 offset =3D 0;
>> +=C2=A0=C2=A0=C2=A0 size_t offset =3D 0;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ssize_t ret;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int i;
>> =C2=A0 @@ -273,19 +274,16 @@ static int wmi_parse_response(u8 *buffer, =
u32=20
>> length, struct smm_regs *regs)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return ret;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 offset +=3D ret;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* WMI aligns u32 integers =
on a 4 byte boundary */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 offset =3D ALIGN(offset + r=
et, 4);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 if (offset !=3D length)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMSG;
>> -
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 }
>> =C2=A0 =C2=A0 static int wmi_smm_call(struct device *dev, struct smm_re=
gs *regs)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct wmi_device *wdev =3D container_of=
(dev, struct wmi_device,=20
>> dev);
>> -=C2=A0=C2=A0=C2=A0 struct acpi_buffer out =3D { ACPI_ALLOCATE_BUFFER, =
NULL };
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 wmi_payload[] =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(regs->eax=
),
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regs->eax,
>> @@ -296,32 +294,19 @@ static int wmi_smm_call(struct device *dev,=20
>> struct smm_regs *regs)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(regs->edx=
),
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regs->edx
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>> -=C2=A0=C2=A0=C2=A0 const struct acpi_buffer in =3D {
>> +=C2=A0=C2=A0=C2=A0 const struct wmi_buffer in =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .length =3D size=
of(wmi_payload),
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .pointer =3D &wmi_payload,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .data =3D &wmi_payload,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>> -=C2=A0=C2=A0=C2=A0 union acpi_object *obj;
>> -=C2=A0=C2=A0=C2=A0 acpi_status status;
>> +=C2=A0=C2=A0=C2=A0 struct wmi_buffer out;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 status =3D wmidev_evaluate_method(wdev, 0x0,=
=20
>> DELL_SMM_LEGACY_EXECUTE, &in, &out);
>> -=C2=A0=C2=A0=C2=A0 if (ACPI_FAILURE(status))
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EIO;
>> -
>> -=C2=A0=C2=A0=C2=A0 obj =3D out.pointer;
>> -=C2=A0=C2=A0=C2=A0 if (!obj)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENODATA;
>> -
>> -=C2=A0=C2=A0=C2=A0 if (obj->type !=3D ACPI_TYPE_BUFFER) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D -ENOMSG;
>> -
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_free;
>> -=C2=A0=C2=A0=C2=A0 }
>> -
>> -=C2=A0=C2=A0=C2=A0 ret =3D wmi_parse_response(obj->buffer.pointer,=20
>> obj->buffer.length, regs);
>> +=C2=A0=C2=A0=C2=A0 ret =3D wmidev_invoke_method(wdev, 0x0, DELL_SMM_LE=
GACY_EXECUTE,=20
>> &in, &out);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> =C2=A0 -err_free:
>> -=C2=A0=C2=A0=C2=A0 kfree(obj);
>> +=C2=A0=C2=A0=C2=A0 ret =3D wmi_parse_response(out.data, out.length,=C2=
=A0 regs);
>> +=C2=A0=C2=A0=C2=A0 kfree(out.data);
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> =C2=A0 }
>
>
