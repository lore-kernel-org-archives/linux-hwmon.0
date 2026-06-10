Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8436332D43C
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 21:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781126964; cv=none; b=qli636oSRABkNjfi7RpMSKi9depz8/qMB2/F6XSZR9FUv7IXvN0v8lhc3/vlZj4U0A+u0XPEFSqi7aI1R/Xw7HxvV+dPQnKmuD8fbYi4b4v3crRGQaqDbI84JjJu95NQYWpIiYgeAprp7+z+9a2mQg3D4uDWTHeHyU0REyQ4A8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781126964; c=relaxed/simple;
	bh=QY8Q7r2ishNwriCRtEuVXD5vPfNzHMw+RacurcwwRNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XQc4b+rCWdh6VeMcOl0j3xkBC+HE4akdt1Uaa7n3oAquHyu3IwNqbwmfGVmqdN+l3GlGpsm9NNNQPObM7PwJdmvuVHr+cv0XL6WRzqtEuUalB7U4XHq5KeSD7OmESb6mfs+vnmS2y1hOetHjFouds8NhxEj0XsI5nBnQQd+y/po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=kTNFvmW/; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="kTNFvmW/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1781126960; x=1781731760; i=w_armin@gmx.de;
	bh=5UM6t9tV13+ruLlXDb50JgISJij66rit8E8x9cNiGGE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=kTNFvmW/H/H754BmY0NxBB0JRBcvBeLIIimDHrp9E2gg1Ea+ednbaFIFwkerQxh/
	 Xl0uN2Xq9+HnLFfK1njuq9OlDoKUQC5SziGBPRNXzxzYtJefpLwoTFDdiZ01LUalq
	 1Wu6lznLuMYBcrtYumavHuJz6T35AVQgwLiezNZfdLMX32/We4L9blpbj5jzIfFxj
	 oRdy9xC0YtlBQa4gDKM8VKY8CZSLSmcREKfcvYAkpYhSPMsHcf50C6s9JSEH3NlBC
	 VQ37ekZnsfQcAIVPu4Jf/JoHdazW9ssGpuk8aonz+RWiDVbFkY4ZAvM4PoxftMinA
	 cdxju92YwogWrnao8g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLzBp-1wogFt0uMD-00TboF; Wed, 10
 Jun 2026 23:29:20 +0200
Message-ID: <3ecc798e-bc90-44b1-80e3-e25c2bbb23d7@gmx.de>
Date: Wed, 10 Jun 2026 23:29:19 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/9] hwmon: (dell-smm) Use new buffer-based WMI API
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
References: <20260610203453.816254-7-W_Armin@gmx.de>
 <20260610204549.853551F00898@smtp.kernel.org>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260610204549.853551F00898@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VsxaNp3rvTDvDTgqcf0P8Qej5XFm/+yPxeTvRUGYjgvffzTFKvj
 bBA9EkG1XFO7GscFD7EbNBS0O82VTBgLaWVG/wIDoVZEHZLcnZnjtImcD/UvUAs8WslIOs7
 rKxHvwGUU4L9RyNQp/sTgvWqxkiKDPLBitNs97zmTYA+h/zFK2+2zteZdkac35JEQMn24u4
 yvy0QnTuBPZPDbRCgD51Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KOOtTGhtbK8=;fLLT6nqM+xyqafv69+9OYYSHFyY
 Li3otaW5JOZWH8CnvBQGjhTedZLIXyxKKJCNXjn6p8mG9pRkPcSKB5BNzOjbfDk6mVA1skU3n
 Gv4K8ZV58oOBweHzKZdzv1dWICXymzmr4eiL2w4zKD/+U5sau/dh3X4UaakdWZlmQ+++hYcml
 3rPe2XynxVOyCiC7iQPAnOyoVVMlISjjBXjN3/9C5xpNI02hlzQ+NHmgjvwDqGxzhbT1CGmGr
 eR6ahXauvFtIv8cKOBylQe4f7OK5CiNMtoS7rPoKfRFcepz19WEU5/uS4GSMLVx/E56oj4gqD
 VN9QetXJspKFWtDTRRWB6rvrjdLhbpXzt8fzIKqPN59bfr63uEBO3HW7i2Rb3+mDpMKW0mbwp
 sddi64OZ46UUJYsHojdpPEHps827fmZAOgJL/uIf5Ph1vfNfuQVqeiEGh6RjAQj8YuydVItAf
 +H+0mP0zyaleZT8bvuXRS1ok+qHxpd0z5QABd82/Iw/BIqcnKDnurAGek5mqbKijjs8R04qQR
 FBOpuNEUI+ItYRjIzYeGLpCfV6v+2KqqzaswtNkuqwRIUn+O4pvvHt9z8FQeF+XJjOTzIDbnk
 Mam17oLt9GJOGaL9dL9fKOX1FM2f7Sy7QwUG9xeeV2LD1uDPYkG2vRY/azE+shYoCnNN21c4f
 VZCKGM9bLye65TqKH0pHkhZXD6ooDK1OalADA/a+QlShc6ddAuvGQvHWu0ylPODzClb67P99W
 0LKOVKW5aRvG0ov2/VJQJI3gskYSg9EZIaZBDcPVeWnslq8yzAx+vZJOIroOB73ORVGQtiwsI
 J/qqmELIHrNXqL5d2VK2QUHRyLFhbfbFLkGWs4J8R0tsgXO22/qKpd42JngRxcscXysfBbIjy
 J9zrloALiuVIaKvtva+kFQFfydtNH0R7xvxbKlwKrH7mggIA3nMEb0SoXWRY50wFRa8dR0NcM
 WtVnasBl+4plydVqXUmeO+EFarqwA9+YF/+KbehRaf2xO1sWw0C3zqnA4M0mkNzO2FN3DrlCP
 H/i+MRB7jCh6EXGG/qJY/8xHlBAwoACOYB0Lfe7RP0AYG1E+yYhyN4sfwto27d2Yeeo1vzpBA
 /3QbXykTZGSfTs8R8GOZ2bIT4VQULY8XlGHwJn/krcI3VNjlZwwv3GVJwWssYSGJrybE3cbtU
 r5X5oakgORXazvx6Q7GzNIvLyxXnUloVv2Vx0Y4pqNyMBb0mQBQee/HN9OfRmhDGorb8n8dkV
 5G/+VjYpn/KaVRFZjcOh5iqeJF/74Yl5+P5HllXPZnH2dtY7mJz8g5n4/T4sd3qBEfWQWmk47
 bTrG44mYznG5/zqrXul/iGyHGoHjxemXWgU1BtDtPGGwtH02rVOrgB/qw8XRP7PDuWPjGEkrD
 eV+hS++QLWifXmWrKiSMkoL6fKJ7R5ptA7x/2PS78WfMxUmPVjhzwqdCtX5RSnqrkhNeELGA/
 koxWjiDonlgmxT/+Aj1TRSDo0DQ4PooHwzURBV/z6lXept2SejvmYtMjFTUhOQxCCxoSNRcdg
 Z79WcLkrJ7IJQcrhByzdPAaM5uPy9ulMUK7ZqX6c911kR1SGx6nISML9Sg5jEJhmm5lCHURwt
 DYs2sveg45+Ccm1dGCwhFs98w7Y7vxkoYElD1bqUHaEnQS8m5ykCcIeWJv9yNkBxhCCoPUy7c
 MJtfMQKwjgFmr+MBLLnU4vorK7dWGmmKrR9SYBZi+enx6M/PUh74ryIgafkESoTPqpXNGtjsX
 dlFS5Y6BaiU1uXmTceiW15cWuKn47sIFn2YXScY2AQfXGok/g1UUNLbAjzg//ZIYCpV+DHcmE
 ciExxmIa2R+yTbzMBAhtW3esjIZEHF7Xhm45ude2vcYMUdvYPJB4ZIN2DOjyyDCoLsqqjjC0V
 MNcw8b8rSHCYdlBMBuTeb1iIJkemA8Wy180GTZ2CUfWijA1UK2q9fKiWeRG08TBY+1bERoam4
 xB0l80j+nTbT7tUoBE81EcwXDmypVPJ1Lz7Xb5s0BoUWqtNoqhOQhw12Kla0DjtipbL29R2VR
 NTVCMP0kVZo8eo7rcaGJY3yxm1TuE9hfOHvGrri3LYQuqPvwQcyYpX9wMnQ/Qz2G8PBeTkbib
 ztfnglbeY/PzWjcJxX4Lw/Uaw/SigZ/U9y4DSr96iNswAxM22hUDIA2qmVOIvGdJcX1mQB5lC
 oBmxkKdTTtdsx7J6rb+Q1vG76qbe8JbNG+gbvw3HvtIp3rP3oqtpmoGq37Sy3C+EXLvZZ2MZ1
 7H+Q3fKlIe3iwbg/0Sni/B2tWojpD2xcsSG3lKKwyHKlI3egK8Vs/5kU0wJKsybiUMkmZRow3
 QIFY5f6ZGCz315TV4wlCNQG82KV/5bI9Ma6A+d8BFSt7E/FAKVOT+xe+dP8bg56PJnHMwV6ph
 37LrV6xCv19xv4wU6HwRKkEZvhF45VBB1w7Gv3RCppBrcvViiouKSK6ZeMfL86TnDBkty3AvS
 EH4eH5iZSQmcOaptKYM611Tmj4QjXbKOi4GhJ6QQ626rtmLeSeYbAnUhZBFbm78CHYcNT9V+J
 eu33avKWFaZR1jnCfSgomDl8DJ4mw0P3aZp9o5REX0mGO4efnQVWw3NkDPd9QNL5jFyHQFbn5
 R57lltY8bILpagPv6gmxc+m/lXa0+ohibjP6Dg26PJ4dgSkjQqDIdvlG33C/TTVcpY12yBmHn
 1hajkqQ7RBkdp9VbbI4Eu+AEDgjgjksWZjmsmSS/nl47JDJCQSX06VBb1AN1k9WcfCFrY+jS4
 VOlhMRy6NyfJT4Pgjpz3Cabzg35Va0XEI3B/s5E1D8O1+4teU+985Pa7uPz5E/HoBy48aZ9xY
 /iHxqvEHqWIWxFyW5mEn2HY3+ms4+mra5ihDjgMPf52CGF8/paWpX3YcILK7wJX5/uKq2I8ws
 kaRPQBnwS++TlPdQNJZOufcm1xfmPxbzHYEFZuAk9B0gglsDLpqs8hI3uIIfh+xxEjuM1ff0s
 /Miht+Bj+03hezGyiIXqAi2c6NuQnnZxPOwd5pb7FOIkJDT45nuEkXhgxTKcyCnoxsJgGnTPX
 0HmAEuWb1tMZTRtYJ7SaD+1L9PVJPpTVt3h05Z57ITBKvepFtzjX333TTTvF2FTBA94KClquz
 Zzaf7CcUc0hs9O/8ix4YMafA+Lf1JhgkzaHAOeOYkGpbYUhu+WVZFdway54MEZzUV7dSbsHBL
 q1wB+tWhuP+O06i6ftapyrmsA29spEn5hLleJs3gWgA8w9Yh3k2KtIQsGGt6+PnmHLIr1VQc4
 GkI7bnXc4drOVuV5sySZduJm879kj52oyfSbYmEDG/BWNWK/ujNwez8vOqk6hdGcPkorqYbph
 gn16HP9SJZ68GeGjyf+boYWV0B0tnvb+/3Haj42FSYBX4Hg612pwn/mnVpw/JOhPuwQ/NSAHv
 OWLFlB4wkOVHFJfSY39zGeFqIKp9J0ZONyMRQW4zGCL7tb24lSMK2E+7X5ConGt02RON978ln
 4ZNLZx8s9PGKfhqrVg/375jcX497yYRnffxYNs1Pgle9+ObzCOE1hhNYpqHAS79jlmJwDuw1t
 xz5Zie7b6NTTRX0V43OtTTrzKs9EWZkz13nczQqs2CWRPDlid0nZE1g8fqWFGHJ37xDn3wYZm
 pLf1t9A8deIlv9mLoMFp7ofLKzWCKVlTvmkrO6n03WBVTaUKgM2oMIIQMf8Ngn7pB+QK1MCgA
 nJdGt43hngIgPI6KHJYXxLdabmtV/Th5A7JhrEnpTpgZYQGIUxMtirL7SFoCypSgsUV+bzF3s
 UsliKGtX8lkgolGqoePbdN+eVt1rdn7kyZPoJuvgGDV7dBbUCk73x7Td7OYmxj6nHe8p5qYLM
 hntSYcAmCSObFx0u3vTCNdFdj0GW+81f+r0kkkkc4qS7qgjp5LjHZksc3PGZI+ophqHLHzHKM
 YCgy5BsEcxAvfrRN6KiOXpKWYwDVkipMgr2TAVjILeGQUdwYzZ9lA693bLTNznij9Z55Gni7K
 jOu4T3bE0yNRS5klIndwilgnFk3sybtcSvJCMNOKohEZ6HHbdznd77rQFtXRKIZWyY3IYzWwr
 qOlzT2WRdpUfz4DTTv2GnvrNqT2VYhgHB/aSHFr82dcL1IaZ3uQ1t8/aOBF/xRpPB8dqIamta
 RdFx5n6WXD1KgMEDq91HqRVp9X3X5rEknOK+kTWMZ7X4FrZAOrKt2zV52OV/JOAWYvnHFoDlb
 2cnfaiNHEMxjgLR+KAgCrE3/mR8j77el3hnwY3wPV/GeIL5G3+qdvpD2GiqKPBBdl5+of2tBk
 a8ZAY6Gaz4gmk7XZEX0RkF9irPUBtkJcH99lnoTXz9IDQ1op1XDaadPga2JG0317r8v/oQOT9
 x6UwJub8Ol77gcAq9ic1wJECqk3lbd17goVjIEi8Q7xR+/ZNMtMDbfRJbqFRSXtzReYUJlvJw
 1pdI20mdl0gkXcfwrBRqzxFhNnn+A+0I7uOY7qNLrCbko7R2lgATDnx6wntrMfXSTt09TDwgH
 AV2MmzNLUQlmAMiuNN5rZ5VmRXwfdTqvD2QTtcj+2JTw8J0Gk5NWEBHrM7QBp/jijORBoTQW0
 TNjawl4THqO0oRSGnxhj4MWlGnXlPFj1pnwzimsCOsXRcpFZMFHoiv+zsO+bjMrz+zdcB8lhE
 yp0PADZQ36SY1QqugaCIf44rhJ2AS5bHSvoIU+sOIGFAQZOcYNFb/1br87bNR49n1RQwlG1AE
 2CTHWSmcfgpnLE2gBP4ci7g6muFLav3qYUfGA7AbQcIV5uynLefS8jD+0SPUD8WZRVKqMsCsB
 MxXGPNQJrkUiYLGESljfirfijMuS7xK/GXH6D25yfXjrReYMcjvoKA6/BH1Nf/qOXsU/BrhQu
 pKFqqm4NxPJ2cr8TG72qFa13IwMFBiJ8oQdUA7Mp+SQmliCVgtpUge2rtDizw1jMuJG690mPu
 kSU736qvKQhKDtEif6fAUeEAyIYubafGAlZId0mSeaeKldKKIpoFVvBmoUP2IScYVSvKOxFeL
 DKoS2Heei9KsCpsXCfoB4mLKtZMJRCRpK6Klzxc7q6viU18MqLSNly43BfIFXzDUGlr28gn5m
 P/pOOjfyABwoA2x8H+zpZpKd23V5FBJUj1DrLIW8oZs5XNGJxuzv2CuBpy8TMeac7/zgP0uUN
 SRS7HbmOlTmG/Vvrf+4txXX8mmmuB+h9FtaG0E7IKV1DOqBYl3msdNhgOlZ17hyLJ3AYBy+sT
 hJXzJnDUgKqkVrN9gzF3rZ7TNHmWvAYVijDzW1HR/9AGh+LFt91AYjps1wJik4gRF5ziEJZET
 NLCP1M9eNlEeDSAk3BGtLZHlSWJSbrRfnVbdfa5bvhwhFtACYo9MXQVZZanGaC0mKo35UJxHP
 K1fZ9sEQTI2hjEmssW3+er/y41z42vgVKz4lV0Ku1uUgVaWRYe5i8tcFGJaghx0yW2g50V77e
 C+b35tPw4zSfkEkMNXaaOl0M82msK8sET7nogF3VhuGBVlz2w2dXsocViI2cZaaqewlgV4pHX
 sxrnCmwszb3oJ/JrMRTDZrd/PUK81ecWN/rQZQNI1xuFIxlmwtgQxZD0LcbbkjuZJZ2PoksDP
 7HIuYNrEw+cwf7HabTHZljUcKzV8r+yw8zhHTLECpQu/KFndYGX4hvFhtfcJTZIW26/veqwna
 syH/TMmMElNEr9yKrQ=

Am 10.06.26 um 22:45 schrieb sashiko-bot@kernel.org:

> Thank you for your contribution! Sashiko AI review found 1 potential iss=
ue(s) to consider:
> - [High] wmi_parse_response incorrectly fails with -ENODATA when the fir=
mware returns fewer than 4 registers, breaking support for valid short SMM=
 responses.
> --
>
> commit 5defcd15874af970946561c0d13ad1b0850d56ca
> Author: Armin Wolf <W_Armin@gmx.de>
> hwmon: (dell-smm) Use new buffer-based WMI API
>
> This commit updates the dell-smm-hwmon driver to use the new buffer-base=
d WMI
> API. This allows the driver to also support ACPI firmware implementation=
s that
> do not use ACPI buffers for returning the results of a SMM call.
>
>> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hw=
mon.c
>> index 038edffc1ac74..6ca2ea4bfe7d3 100644
>> --- a/drivers/hwmon/dell-smm-hwmon.c
>> +++ b/drivers/hwmon/dell-smm-hwmon.c
>> @@ -261,22 +263,19 @@ static int wmi_parse_response(u8 *buffer, u32 len=
gth, struct smm_regs *regs)
>>   		&regs->ecx,
>>   		&regs->edx
>>   	};
>> -	u32 offset =3D 0;
>> +	size_t offset =3D 0;
>>   	ssize_t ret;
>>   	int i;
>>  =20
>>   	for (i =3D 0; i < ARRAY_SIZE(registers); i++) {
>>   		if (offset >=3D length)
>>   			return -ENODATA;
>>  =20
>>   		ret =3D wmi_parse_register(buffer + offset, length - offset, regist=
ers[i]);
>>   		if (ret < 0)
>>   			return ret;
>>  =20
>> -		offset +=3D ret;
>> +		/* WMI aligns u32 integers on a 4 byte boundary */
>> +		offset =3D ALIGN(offset + ret, 4);
>>   	}
>>  =20
>> -	if (offset !=3D length)
>> -		return -ENOMSG;
>> -
>>   	return 0;
>>   }
> [Severity: High]
> Does wmi_parse_response() incorrectly fail with -ENODATA when the firmwa=
re
> returns fewer than 4 registers, breaking support for valid short SMM res=
ponses?
>
> Based on the changes, it appears the parsing loop previously allowed a s=
hort
> response to be fully consumed (where offset =3D=3D length), eventually v=
erifying
> it and successfully returning 0 while leaving any unprovided registers
> unchanged.
>
> With the updated code, if a BIOS legitimately returns a valid WMI respon=
se
> containing 1, 2, or 3 registers (e.g., 8, 16, or 24 bytes), the loop par=
ses
> the provided registers and increments offset to equal length. On the
> subsequent iteration, it evaluates offset >=3D length as true.
>
> Instead of succeeding, will this now fail the entire SMM call with -ENOD=
ATA?
>
> Could this functional regression break hardware monitoring (e.g., fan sp=
eed,
> temperatures) on Dell systems whose BIOS provides short WMI SMM response=
s?

Short responses where never valid and where never accepted before.

Thanks,
Armin Wolf

>
