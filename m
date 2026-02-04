Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC752232395
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Feb 2026 22:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770245723; cv=none; b=o82dMkPsfPpOFBKPNZCxpgpk+7oMpjTr9Fpf4piRwGLd1xU+Ah3yyKC0Uhr0y04lXTyDTUU4L4NCW8nDCAOrKmkGYktlYOEAXfc1IVEQfQe1oquiLLZXW/ccPHrDAwpjDuTBaCqR/mDjKLhAQymXySzZso2DJXJFaCICAuvwC0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770245723; c=relaxed/simple;
	bh=9srwayobW4de1kCTRCOy3IPB5I5+X6acrdYr4VvR1h8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=oFarD2VjcKCfmTZZJkvmOVgGRUsSvOVWWEO79ASo4MdsBSDymr/ICIJMGVfaAbPMiSZEqdseZtZftJRNexS4sQJNqsSJC/TlqCQPAEjB8Y/AU3EspBKBvRyXRa6S2GFCnK2fsCgp4JuY2oxcIF6cgAcKTjRxYRyYTJh6d45e6IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com; dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b=fAHjkmDo; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b="fAHjkmDo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: Subject: Cc: To: From: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1770245722;
 bh=+y45//Ri0drWpc8byEPLnU96f/moRcsBEJz25PsD+bg=;
 b=fAHjkmDoPpLyNZm3notYzGd+g/u7aVFAwNqlpFZHpPZ0P3M/DROAvPvoAm/rOBGd5+DB7Nov3
 qnIxnstJXmKnmvmWiRv4V3IlESNHhxWQkUoAZOMvx1HKaNYgb/tHA3F76mEiE1Ahz/J+xgpXpAb
 QhLdyG63+Xq38iFBKf0tUAfM7geu262E1fG11pOkrnP/RaldMW8Ho+Y6CwzfcRZgoPaBvOAohUN
 KTn57ehbQCyOqxQtyT6LRXVYmeK11r/1RgxWga56WOjlr6DT/L40mQXhUHI294QwQABy+41pyH7
 9KFdPzFI7ppcSASH9y1/ldDKt7D3Zlls3tpAtDgKUWVg==
X-Forward-Email-ID: 6983ce563641d1bf5671fe86
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.6.0
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Wed, 04 Feb 2026 17:55:16 -0500
Message-Id: <DG6JQFD4244G.2DXHNWR3VQ1TL@ubuntu.com>
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Guenter Roeck" <linux@roeck-us.net>, <linux-hwmon@vger.kernel.org>
Cc: "Guenter Roeck" <groeck7@gmail.com>
Subject: Re: [PATCH] hwmon: nct6683: fix memory leak in
 nct6683_create_attr_group
X-Mailer: aerc 0.20.0
References: <20260204211543.70029-1-jpeisach@ubuntu.com>
 <3887feb9-344a-43e3-935e-8d651f9b923b@roeck-us.net>
In-Reply-To: <3887feb9-344a-43e3-935e-8d651f9b923b@roeck-us.net>

On Wed Feb 4, 2026 at 5:09 PM EST, Guenter Roeck wrote:
> On 2/4/26 13:15, Joshua Peisach wrote:
>> If allocation fails, free prior allocations before returning.
>>=20
>> Not tested on real hardware. Did not update rest of file for style
>> changes, only updated the NULL conditional checks.
>>=20
>> Signed-off-by: Joshua Peisach <jpeisach@ubuntu.com>
>
> Allocation is with devm_kzalloc(), so the memory is released after
> the driver is unloaded, which happens immediately because the probe
> function is about to fail.
>
>> ---
>>   drivers/hwmon/nct6683.c | 16 +++++++++++-----
>>   1 file changed, 11 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
>> index 6cda35388..365f6b99d 100644
>> --- a/drivers/hwmon/nct6683.c
>> +++ b/drivers/hwmon/nct6683.c
>> @@ -431,18 +431,18 @@ nct6683_create_attr_group(struct device *dev,
>>   		return ERR_PTR(-EINVAL);
>>  =20
>>   	group =3D devm_kzalloc(dev, sizeof(*group), GFP_KERNEL);
>> -	if (group =3D=3D NULL)
>> +	if (!group)
>>   		return ERR_PTR(-ENOMEM);
>>  =20
>>   	attrs =3D devm_kcalloc(dev, repeat * count + 1, sizeof(*attrs),
>>   			     GFP_KERNEL);
>> -	if (attrs =3D=3D NULL)
>> -		return ERR_PTR(-ENOMEM);
>> +	if (!attrs)
>> +		goto out_free_group;
>>  =20
>>   	su =3D devm_kzalloc(dev, array3_size(repeat, count, sizeof(*su)),
>>   			  GFP_KERNEL);
>> -	if (su =3D=3D NULL)
>> -		return ERR_PTR(-ENOMEM);
>> +	if (!su)
>> +		goto out_free_attrs;
>>  =20
>>   	group->attrs =3D attrs;
>>   	group->is_visible =3D tg->is_visible;
>> @@ -481,6 +481,12 @@ nct6683_create_attr_group(struct device *dev,
>>   	}
>>  =20
>>   	return group;
>> +
>> +out_free_attrs:
>> +	devm_kfree(dev, attrs);
>> +out_free_group:
>> +	devm_kfree(dev, group);
>
> That defeats the purpose if using devm_kzalloc().
>
> NACK. There is no problem.
>

Ah - I didn't see that was how devm_kzalloc works. Should I write some
documentation in devres.h to clarify its behavior, so this doesn't
happen again? Once I found it in the header it made sense :)

--
Josh

> Guenter
>
>> +	return ERR_PTR(-ENOMEM);
>>   }
>>  =20
>>   /* LSB is 16 mV, except for the following sources, where it is 32 mV *=
/

