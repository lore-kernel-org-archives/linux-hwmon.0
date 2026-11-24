Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529508;
	b=elgn3KbrM6tLYXlRpu2X2bdb31BLJuSPe3rkXrUYtvyqrX+V0csis++38j7t6BXgGbRN
	 xG/6EtJ0VcLZit4xEwhPvYnPBuzEOxd4rtw2X141c0DoNmInOXsskjOcwckFT7VT1vUrh
	 1A+rYH2pThWR4NKH7Z3MKL/J4zKkvWQKmhoVrImdrXjQZvvp3vPOD6EFJDBfsNKM9RKaK
	 8tj32kVESb7FJLvHgM7VB8vbWZM4Jjl8ulfSn4P60JPFcaVVZ45kxq4eNnkAt5m9ODGnp
	 2xsJrwUyjJVy/SSqyt0gOFRQh6n9lqQlr9sDkUV8TnE4Y0ouM/ITQWba5VC7/+g+zsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529508;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=yD1md+X5BGNCLnvBTE6z411ySGDanA16QrjaFM3gVP4=;
	b=hOLQ1+t76Yn1Y9wPLRNiA3cQcfAXSKjdjbL8cLhYR+7JNmPuRC6C2KpzqywJ29dMfofh
	 +UQSbchSr5KIXhQcODks5Z9AI6PmOpI2OyBAcU0XPBd00Cu8NoxFx1n7iVZ/DnrYZj8HW
	 mxpZPkBNsenW83OzfY5B1WzA4RXLUDDbAxT1ocs1f7Fz2osMQ/oLHIYJ3/W1tMAz/9DRF
	 HW/RSPrPuUHZcMnAspDM8yTeEGqtHN1L5qqiSNTGWxUNM950Dj2DFh6iKcoYrtpVHTXci
	 PjMao0mbUGzgXXp6cQt4fLhDbA+rHQA5WWrbQxyfurSIfDUQJ3k8HUig8u1V3aTIafA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=COR9SmMa;
	arc=none smtp.remote-ip=212.227.15.19
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820B8606A31E
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Nov 2026 14:11:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 820B8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=COR9SmMa
DKIM2-Signature:  i=1; m=1; t=1795529505;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZz4=;
 d=gmx.de;
 s=s31663417:rsa-sha256:O3IToJPMOhljIFDMqY/KKlO4ViHl
   +ytiUaiTe2JdX/8jJhqeFdv58zweKL25j5vaCDuzDFBNxS33xsxj2BIMkB3sI9G70Ij/r9Ip9p4
   cvGWdJmZZT8e4lhr+cD1zdlHL8IKhH799gyNj82GUQRbp64edrg8aH3LqsVgPUZULx5yBiAKLZn
   8Xb5V5f+jY9vaLXAeBVLWrDopGbvRupFF8/9Nz1cNiepGTOgp25CRFi6GkDShfQRS54bMCeSu5o
   pmy/IPrJmycVTAN2NrFa4CVhK0qBlDdIkzRgTqvEr7WB4DfbiM+GS9rIGWMA0nJ0gPC5T/hs+JS
   G7046ubqtP9tAg==;
Message-Instance:  m=1;
 h=sha256:
   h5Dwr9zkTqL5neghdTsZYKi3KrPMKEu2tMlmDGqjmJA=:
   yD1md+X5BGNCLnvBTE6z411ySGDanA16QrjaFM3gVP4=,
  sha512:
   /i93rFh938amEeP9NHrWSAMYyXpCuuaGzM7ueNeql/+46e0zENxZb1txL+Z+puwq1qap2xPaegE/WbiF9jtHmQ==:
   2Ba5RpMiRF+EQsBXcroZVykVtq+zycfcBeEyE6tnhAMo0yFWPKWXZr4faPbvbmeRV9kTtpn+hr8JWP2E0EwFhQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795529493; x=1796134293; i=w_armin@gmx.de;
	bh=yD1md+X5BGNCLnvBTE6z411ySGDanA16QrjaFM3gVP4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=COR9SmMaHez11ai/EswFbSnc7X5TvOAiP8+xPa6En/E2kc7vln7A1v4Cuyurz91B
	 za7eAV3BYTkaWoTLrQjy+lz00aieZf2agMaGX4UqdyI75G4UAP30NMAD4sdGSSFDR
	 FSuQaKQCx5hnbo/6BuT8JfW+sCaSX3q3byfqm2r28m5LfBuOiB4TrO23h9JhDltwd
	 oCZV/8HxEpJiUgN6K5xd1jRivZ0lnZpj10xO9Kc24nhbYcl/jc6yq4RNTrSsOOk3Q
	 STUnDXCwA9koA6ZZ/xw2SxnHb0HI+9CkG03pYBgKd3joeXJ/boHkenXzax1UTo9sn
	 huBrGUlE3hCGrami7A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MgNh7-1yAfVK0dX5-00kCUc; Tue, 24
 Nov 2026 15:11:33 +0100
Message-ID: <183bffc9-901c-4a9e-bfcc-1f63a125a32c@gmx.de>
Date: Tue, 24 Nov 2026 15:11:32 +0100
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Unknown values check in acpi_power_meter
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.de>,
 linux-hwmon@vger.kernel.org
References: <20261123110616.1a3b8290@endymion>
 <f248e88c-e328-4118-9282-09f6829ebcc7@roeck-us.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <f248e88c-e328-4118-9282-09f6829ebcc7@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iB5DgwKuEjm8KO7HTeE0jszRKDu9CED/VTMgB+AqnI7Ex727Zrl
 SMWdKK+J5joIIMWl4SoTunhiQOmUWN+ZfIv0acwm4YaZWzQtdELRnAHy7Xhv/0LhgwzvspY
 TyLVWUraxmWBqhVzWEK8w9XIvJEa3Xusdg50KxUnd00E7Z48gzLERBksGI0U1OMwgQNXwcr
 Y6tDH4jzj3HL1m/YOCMsA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:w7wjdUpyzbc=;hj8QtRe9hLNmif/9u8PnLGKNeVC
 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

Am 23.11.26 um 17:23 schrieb Guenter Roeck:
> Hi Jean,
>=20
> On 11/23/26 02:06, Jean Delvare wrote:
>> Hi all,
>>
>> I have a concern about the following construct found in the
>> acpi_power_meter driver:
>>
>>> /*
>>> =C2=A0 * ACPI integers can either be 32-bit or 64-bit wide, so
>>> =C2=A0 * we have to check for both values.
>>> =C2=A0 */
>>> static bool acpi_power_meter_is_unknown(u64 val)
>>> {
>>> =C2=A0=C2=A0=C2=A0=C2=A0return val =3D=3D U32_MAX || val =3D=3D U64_MA=
X;
>>> }
>>
>> If the implementation is returning 64-bit values on a given system,
>> then only U64_MAX means that a value is unknown; U32_MAX is a regular
>> number as any other and should not be handled as an error case.
>>
>> Don't we have a way to figure out whether a given ACPI integer object
>> is a 32-bit or 64-bit value, and only compare the result with the one
>> appropriate special value which means unknown for that integer size?
>>
>=20
> I didn't like it either, but I asked Google search. There is
> acpi_gbl_integer_byte_width, but it is not exported. It recommends
> to use the above code for modules. I don't know of a different
> mechanism.
>=20
> In practice, the value is checked for properties which should never
> be even close to U32_MAX, except for the power value. For power it
> returns -ENODATA only if the power is exactly 4,294,967,295 mW,
> which I found to be an acceptable trade-off.
>=20
> If you or anyone else has a better idea, please let me know.
>=20
> Thanks,
> Guenter
>=20
>=20

Hi,

if i remember correctly then the ACPI spec says that the results are=20
32-bit integers, so they should newer exceed U32_MAX. We only check for=20
U64_MAX because some 64-bit ACPI firmware is using the 64-bit Ones=20
contant (0xFFFFFFFFFFFFFFFF) without masking the upper 32 bits.

Thanks,
Armin Wolf
