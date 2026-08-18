Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0498383984
	for <linux-hwmon@vger.kernel.org>; Tue, 18 Aug 2026 15:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787066434; cv=pass; b=tCATaJSQV7T+CSNmYZX6GSgsYfY3+mZQx4xiRU1mu+2SZ+Qq0B/6mWbF3SrK83Glc0mGplnSFnr8ldOIUK49/9GVfSkDaL78Lbgw0E2eShiKU8j2sTspQuoL1VOmRyhIa4xtWl2qt8Z0vcLkUF7Iwxxx6updGNWXEXzCEgj3FAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787066434; c=relaxed/simple;
	bh=vjU7rAU17Y+Ajkl7O8E6XTeIaV4BJn5MAyy2AaPQZhw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mJIqSMB8VBalpkSHO8/gTyPI7t4MwwWKBM7mt/N53lHIj6wpjsdKwf+oaBHi/N7rGB5W+kgIy0Cmp8d13i8P8tdf2j26HnJ1h7wgGID5nF4zFSUw2RDIfmZHczK6iaL8A8Uk4xYH5dvgtrPEDy8mDlNG31heSQApeWXyDirg3kk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXNeNNc0; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXNeNNc0"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-526f963372aso30390191cf.1
        for <linux-hwmon@vger.kernel.org>; Tue, 18 Aug 2026 08:20:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787066431; cv=none;
        d=google.com; s=arc-20260327;
        b=mBjVbj4u7VlZ/rp5SwyxNJh20BWoZcMhv4BcEibWFhKeMWmyNBv5crPr8psVQ9qggR
         SEBmLP9GRXqUNxt9f7y5lVXx1qwQEva+uSWXFSGpYhLqoe2hAHxDeq68TaYbRDaLdfhZ
         5iwvamXSPK9WMA7P5/NvsVaZZz5b2EgFpnE0wRvJ6Xj6WTXJtG8KAp20t0xtJ2bzJnYf
         b/zBiSKUDUqqZ+HyBYs7j6PQK19dBc41F6XZNuJRV1gGRTJ+LhgVLe9wyzEpS38pT7YB
         CYtVxtsc0bQnB6u16uL32zheyYhn9m18YC4+YoPn3jClyqNGfiYsAZMOQ3doWJ86bMrX
         Pbew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qU8YMMf/nYNKPEmYXubnfHF/pa+Nrin9IzXXJguRCnY=;
        fh=vdgrNZcMboPOJDzNURpG0zeTQS8CecRIJcgzaKivCds=;
        b=E0VMBFgH/BlSd9HFsvmpQZX7okn+QfTf4OtUEwQGAvmimmGG1MSqia1Qge0eX3Nk9d
         I8BBlP9qQv45hsb9v635nOYXuKWk3F4i0Ysq0ue7m/f7TJAAqQZPRjwu4tA6BdCr44tv
         /3dIzJjVfl6Z3Nj5Ai444/ZAkUsi6mH4kaD3NtSL9ySIPuEhRjPqZZT7EEfKz0GyFNOm
         nIGDg4odYCQt5wGElg41pcIvHRnkNRrx0RLAC8b7vI2aOxw8WgCWS5fi1Nmf52OTudGn
         NS9DalsTuwYwUAex72lj9t9JKlryKIFvMGOscEBmEEcJ1cd7JK10a/p1uaN0Tv9vny+9
         5WPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787066431; x=1787671231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qU8YMMf/nYNKPEmYXubnfHF/pa+Nrin9IzXXJguRCnY=;
        b=BXNeNNc0iM/1TsFOTDco3wGWuZqUGIoHLQZqofVHEWRJiiUjW+MZk51+BnNWaEAc+H
         xmzoVhIAj9PhVqvuBLLSvFF5mcR8QFqMsyIE5NqBqOLc9TrvOACcoBJnF37f410f11SC
         m2v3pk7SuR3VRCSNsclth6HLcgnHv8ygS9J1K8na09y896NNhjlR+s/OwuNQquHQv1Od
         JZfta8pyKieZ+1rtC8Kb4Y+KHxFfMXwTPIYzcKb5aud+mIhvp4jNAS8uQXsI3N1m/9Vr
         Fs/Jx2ZNfUJA3vR27wNdsOVldsHE20NDHWOZD0jL1PGSz/J9F3ym9mdlSHkNyb56UCnH
         BxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787066431; x=1787671231;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qU8YMMf/nYNKPEmYXubnfHF/pa+Nrin9IzXXJguRCnY=;
        b=msYeHr9gR3N5w8xc+rfht6EaVbM5n7S/KXH8KRNF/oBzZgD44cQQLwPRSSEcfa8REn
         D6ZDjYW+Xt06ek3hPZNetZOE5BDZNCuLXJXQdhx59CaKpvSosXpN4ZXWxoC6QMzyialK
         eYn+/pfBazOcz3VyrsTpLdFBtCiG7IDPeqpHajHP2aI7FUhv8ifgdya5nNvam/1yz4iT
         apUHb5fzq/MDQgkVrrZfuF54q5M/h0Oo1Bp20L5Zjzp7mxiAsImAyxASbCoNzws7CYN7
         9PBvngRSqq15j3/wOF9rhDtnHYc2hdefVnBUkIq2Fc0C5PLUB1YLD5rbhZJ0brCZjCkC
         jCXQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqca/3AUvHHj5WQT7pAM55nNtutbPnDaHDmaTuyEo6TpSQ6d2ym14aXvR6+rn6V6UF9322A2rVRpgHJ5w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0vKfbNxlmBTu80SY9heySmM6t6xSHxMwZJ6hqW+1Mq+C6uI2q
	10/KtHt+XyUpzjQvmXvbiS+PtEnS4u2SnnkNIKvuwZDF5cusBl6ZSTV6P1r6Xq6mT4uVzXKoL8s
	VlPtKqtukhkmmw+SsEt3ToXKQxW1nGSw=
X-Gm-Gg: AR+sD12nscPkbXyD0c+9lKde1PBuisQ8NDlaxRlq1bUb7Tme1PSv3iL1MTtkjRyLR3V
	tnHzIoGdrNxZhzU5CuVfqz2/JTd6FlkKZGKqtQHrPdwtxWYsN2H5Q2nHImvm6ik/lVULOX0wIkr
	Nx9P8gCCW82bgjT4aAo8ic6rOQr+qFjIVNaIiGI5AofRfXYNl3PZAzld2CthGQMEY+79tujkSuT
	BRXg/StEaCOwjRBZgN9NTKisj2RZKdPeVEqJhaEw+N5wkcc8opCyWjn30j+ivoDg3R/RZXDgNVu
	n+/a/M3n6uPWX/KFhTuqeAxM2yg04mLuT+5DyYFVVg==
X-Received: by 2002:a05:622a:2cc:b0:51c:94f:8ce with SMTP id
 d75a77b69052e-52d854ad1b2mr314761021cf.34.1787066431119; Tue, 18 Aug 2026
 08:20:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250511204427.327558-1-lkml@antheas.dev> <20260803221614.59324-1-derekjohn.clark@gmail.com>
 <20260803221614.59324-2-derekjohn.clark@gmail.com> <f8b2c85a-2800-c9a3-4e56-7af4c53823e5@linux.intel.com>
 <58a9c644-98c2-47ee-b083-0d5b19fa5053@roeck-us.net>
In-Reply-To: <58a9c644-98c2-47ee-b083-0d5b19fa5053@roeck-us.net>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Tue, 18 Aug 2026 08:20:17 -0700
X-Gm-Features: AcwNN1U7DN5Go1yIu40SK85tR1B_mrKqsG5brwcnRyJxEMMZy5vMLKSS7cQq1yE
Message-ID: <CAFqHKTkyVxAKUjjsuHi_+38hQw4n=crYPiPFcrQvdLw1e6qRcw@mail.gmail.com>
Subject: Re: [PATCH 1/6] platform/x86: msi-wmi-platform: Move guard out of
 switch in platform_write()
To: Guenter Roeck <linux@roeck-us.net>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: lkml@antheas.dev, W_Armin@gmx.de, corbet@lwn.net, hdegoede@redhat.com, 
	jdelvare@suse.com, kuurtb@gmail.com, linux-doc@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On August 18, 2026 7:42:40 AM PDT, Guenter Roeck <linux@roeck-us.net> wrote=
:
>On 8/18/26 07:12, Ilpo J=C3=A4rvinen wrote:
>> On Mon, 3 Aug 2026, Derek J. Clark wrote:
>>
>>> The ML patch set uses a guard within a switch case that violates cleanu=
p
>>> rules. Move the guard outside the switch so all return paths are covere=
d.
>>>
>>> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
>>> ---
>>>   drivers/platform/x86/msi-wmi-platform.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform=
/x86/msi-wmi-platform.c
>>> index dfb65ac8fbf6..33acd448f674 100644
>>> --- a/drivers/platform/x86/msi-wmi-platform.c
>>> +++ b/drivers/platform/x86/msi-wmi-platform.c
>>> @@ -675,11 +675,11 @@ static int msi_wmi_platform_write(struct device *=
dev, enum hwmon_sensor_types ty
>>>     u8 buffer[32] =3D { };
>>>     int ret;
>>>   + guard(mutex)(&data->wmi_lock);
>>>     switch (type) {
>>>     case hwmon_pwm:
>>>             switch (attr) {
>>>             case hwmon_pwm_enable:
>>> -                   guard(mutex)(&data->wmi_lock);
>>
>> While I cannot see the code easily, one could also add braces to inside
>> the case to avoid this problem.
>>
>
>I don't see the code either, but wouldn't this be a use case for
>scoped_guard() ?
>
>Guenter
>
Hi Ilpo, Guenter,

Antheas has indicated he's already tracking adding {} to the guard in
his response to my cover letter. I agree with Guenter that
scoped_guard would be a reasonable adjustment to this change.

For context, here is the full switch case, derived from [PATCH v1
05/10] platform/x86: msi-wmi-platform: Add platform profile through
shift mode in the parent series:

+ switch (type) {
+ case hwmon_fan:
+ switch (attr) {
+ case hwmon_fan_input:
+ buffer[0] =3D MSI_PLATFORM_FAN_SUBFEATURE_FAN_SPEED;
+ ret =3D msi_wmi_platform_query(data, MSI_PLATFORM_GET_FAN, buffer,
+     sizeof(buffer));
+ if (ret < 0)
+ return ret;
+
+ value =3D get_unaligned_be16(&buffer[channel * 2 + 1]);
+ if (!value)
+ *val =3D 0;
+ else
+ *val =3D 480000 / value;
+
+ return 0;
+ default:
+ return -EOPNOTSUPP;
+ }
+ case hwmon_pwm:
+ switch (attr) {
+ case hwmon_pwm_enable:
+ buffer[0] =3D MSI_PLATFORM_AP_SUBFEATURE_FAN_MODE;
+ ret =3D msi_wmi_platform_query(data, MSI_PLATFORM_GET_AP, buffer,
+     sizeof(buffer));
+ if (ret < 0)
+ return ret;
+
+ flags =3D buffer[MSI_PLATFORM_AP_FAN_FLAGS_OFFSET];
+ if (flags & MSI_PLATFORM_AP_ENABLE_FAN_TABLES)
+ *val =3D 1;
+ else
+ *val =3D 2;
+
+ return 0;
+ default:
+ return -EOPNOTSUPP;
+ }
+ default:
+ return -EOPNOTSUPP;
+ }
+}

Thanks,
Derek



>>>                             buffer[0] =3D MSI_PLATFORM_AP_SUBFEATURE_FA=
N_MODE;
>>>                     ret =3D msi_wmi_platform_query_unlocked(
>>>
>>
>
