Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC7929B8C7
	for <linux-hwmon@vger.kernel.org>; Mon, 17 Nov 2025 15:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.10.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763394630; cv=none; b=EPNSfYtgiRBM6N4UPiH//jWDY3gBZXw73INDCiO5jgjKFk+cNUHp28HTrsq6smqDmFUOpUMQsCvKzpKcIooVWMOol3VGm6LuIvKf25dMV86ohTj5zqiz0Ivxa/BxW7FlHPQEM+EZ0a7Gp7M26IrBdJCtiOAM4wrOdkMM6V6Us/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763394630; c=relaxed/simple;
	bh=7nANpepey1YCazscOBJxERqpY6+yGwaMeAkfDYW5SYY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=VQyANjVONYddAUBs4j/luBiYds2CxPO4stKjLTDRO+XP7o5dmVWetr6OASIdwW1zGaCFkSFa+1rSZpk0q9tqqbdQl3r8PJmXj/Yu9WH7tyzS+CF0JkjD/dpzlZiHXLOHDktvcied4pxUw30rlxEpfyiU5V31JPGI1KlPEGxQuiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de; spf=pass smtp.mailfrom=exactco.de; dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b=I0nK6yfA; arc=none smtp.client-ip=176.9.10.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exactco.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b="I0nK6yfA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:In-Reply-To
	:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=4/yz1JQB0okeDleJBA9FUteSIyzXRM2tBIPo6US20kg=; b=I0nK6yfAc+5nc8fqd59HexFd8M
	XQjXzs82Vxvtb2sBOKB2JqyDuDf4brlpkgKCqJso/zllfYPItto7UOKwyMFVkmcUuIPJFK6YQwnX6
	7l7qO+cnQlGPy4CQjyRUKmK1uFi3wW2odANCt+X+KDRtz3Db/oMzxEKg/r1QrNYqLlsXJLcoidvSm
	z2+FJmsSYhCkGqH1Wri1qEF+Sgcn6ZXLlpQ48U/Agb4yIsjY/do4pKIwMo93OCioD/IlxOPA4D2u0
	JVr054AcfY7kcIjFB6Ww8ttO/zPs4jxABqbiYtyHU6Nl8PX1/IruMXAbMbvy4IWY5hndNasAUV3h8
	ro5LOeaA==;
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH] add Via CHA ID to via-cputemp
From: =?utf-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>
In-Reply-To: <9e761121-91f7-43b1-9f7f-866acf1fb7ad@roeck-us.net>
Date: Mon, 17 Nov 2025 16:50:14 +0100
Cc: linux-hwmon@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <39A4B79C-EB4B-435F-BF08-C5689B92E70A@exactco.de>
References: <20251117.133746.173713564005237147.rene@exactco.de>
 <9e761121-91f7-43b1-9f7f-866acf1fb7ad@roeck-us.net>
To: Guenter Roeck <linux@roeck-us.net>
X-Mailer: Apple Mail (2.3826.400.131.1.6)

Hi,

> On 17. Nov 2025, at 16:44, Guenter Roeck <linux@roeck-us.net> wrote:
>=20
> On 11/17/25 04:37, Ren=C3=A9 Rebe wrote:
>> Add Via CHA ID to via-cputemp to support reading that CPU =
temperature,
>> too.
>> Signed-off-by: Ren=C3=A9 Rebe <rene@exactco.de>
>=20
> checkpatch complains:
>=20
> WARNING: From:/Signed-off-by: email name mismatch: 'From: Ren=EF=BF=BD =
Rebe <rene@exactco.de>' !=3D 'Signed-off-by: Ren=C3=A9 Rebe =
<rene@exactco.de>'
>=20
> Patch subject should start with "hwmon: (via-cputemp)"
>=20
> Your patch does not apply to the tip of the upstream kernel =
(v6.18-rc6). Please
> rebase before sending the next version.

ah my bad, it applied for years and the stable release, I should of =
course have tested it
with latest git. I only work thru the hundreds of patches people =
complain I did not upstream.

> Information available about "VIA Centaur CHA" suggests that the CPU =
was never
> released. You'll have to provide more context and explain why it would =
be necessary
> or even make sense to add support for it anyway.

Well they are popular enough that I have two and even this Linus Tech =
Tips YT
channel got one, ...

I have no problem to keep it in https://t2linux.com =
<https://t2linux.com/> for fun, but I=E2=80=99m happy to rebase
it if to document this last VIA CPU driver bits. Your call I guess.

	Ren=C3=A9

>> --- a/arch/x86/include/asm/cpu_device_id.h 2025-10-07 =
17:07:15.564453320 +0200
>> +++ b/arch/x86/include/asm/cpu_device_id.h 2025-10-07 =
17:12:32.812472408 +0200
>> @@ -19,6 +19,7 @@
>>  #define X86_CENTAUR_FAM6_C7_A 0xa
>>  #define X86_CENTAUR_FAM6_C7_D 0xd
>>  #define X86_CENTAUR_FAM6_NANO 0xf
>> +#define X86_CENTAUR_FAM6_CHA 0x47
>=20
> I can not touch this code without Ack from x86 maintainers, but you =
did not
> copy the respective mailing list nor any x86 maintainers. This is =
especially
> necessary since the CPU was never released.
>=20
>>    #define X86_STEPPINGS(mins, maxs)    GENMASK(maxs, mins)
>>  /**
>> --- a/drivers/hwmon/via-cputemp.c 2025-10-07 17:03:12.142438673 +0200
>> +++ b/drivers/hwmon/via-cputemp.c 2025-10-07 17:53:55.232621776 +0200
>> @@ -134,7 +134,8 @@
>>   data->msr_vid =3D 0x198;
>>   break;
>>   case 0xF:
>> - /* Nano */
>> + case 0x47:
>> + /* Nano / CHA */
>>   data->msr_temp =3D 0x1423;
>>   break;
>>   default:
>> @@ -273,6 +274,7 @@
>>   X86_MATCH_VENDOR_FAM_MODEL(CENTAUR, 6, X86_CENTAUR_FAM6_C7_A, =
NULL),
>>   X86_MATCH_VENDOR_FAM_MODEL(CENTAUR, 6, X86_CENTAUR_FAM6_C7_D, =
NULL),
>>   X86_MATCH_VENDOR_FAM_MODEL(CENTAUR, 6, X86_CENTAUR_FAM6_NANO, =
NULL),
>> + X86_MATCH_VENDOR_FAM_MODEL(CENTAUR, 6, X86_CENTAUR_FAM6_CHA, NULL),
>>   X86_MATCH_VENDOR_FAM_MODEL(CENTAUR, 7, X86_MODEL_ANY, NULL),
>=20
> The hard-coded numbers were changed to defines with commit =
5cfc7ac7c1bf6 ("hwmon:
> Convert to new X86 CPU match macros"). I don't know why that commit =
did not also
> change the case statement above. Either case, I'd suggest to either =
use defines
> everywhere or not at all.
>=20
> Guenter
>=20

--=20
https://exactco.de - https://t2linux.com - https://rene.rebe.de

