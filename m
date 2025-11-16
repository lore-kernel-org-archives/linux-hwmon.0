Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3511F22756A;
	Sun, 16 Nov 2025 16:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763309143; cv=none; b=kHPT/ePiQiqcurQLSppp8Dv1cs9B7i5G8W1fX1yy7rb83RQLgmvu6N+w6fOAjrBDStqN2zLs5j1bT7oWT06j4FW2i8wIKH8lJlrBcF3ZPn/S+wH8+F2t6SjU6SwJ1IZvhZqs51S13woUEIVtLJ+30oBId6DdmZs2nVkk3tbVa00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763309143; c=relaxed/simple;
	bh=aZmSK/TKNqKOLkjhSm/eKnHhI1d+ZoTUwDSDCgu+i40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CgqzZqf4bJW49qoR7x2iR0jYtcfOYJe5bStLKcCWB0fIo3s8tj8ZIhZqzXc7H1f2ReUE7HSoX8Su2e4cWGSOaDBpY9Qvmk2fgDJZt8sAlSoeQxT88Yhf/Zk0yw54tSCUyUjjXtBzyAAxfAACVmz0wvD/Trvap0xdsGsK9rrwmnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=XpYpAEMG; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="XpYpAEMG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763309135; x=1763913935; i=w_armin@gmx.de;
	bh=k6NcC4csESdTBLUfTfTJ1xpMwyfKzYGPGUBfPwLRxEI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=XpYpAEMGCD+kemqItYre+f7IA0pUIAaBisr9u0/0N/fYXtGgyZcvYjiw0n2ftOP6
	 iYcKyEipX/r7DegZb4jFPNKX5EHvN4uta1SqxNzgHvaLynRmvXPZfQEoqXvAf0bi2
	 MeXIXnE6udFNaVdM0ZUm8VSbYEzvgQ4QCysNb59YAM5HHMsZRKMH8AlkVJ824MSPC
	 cvbN1ovmEEFyKvDo6qIy9rAPwA2NCJBaSUaAKqKjc8RdO45fussXYnXJ1Y3wxwrLf
	 ayFhpF2xBHVJ7FCM+PKSxwkXqfukMiyry1Ukdx1sNWWtPUPF3DxifBjK9jGdIRD5b
	 JSD/gfKXYkihPwUVVg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHXFr-1vOjs73p69-008YY5; Sun, 16
 Nov 2025 17:05:35 +0100
Message-ID: <c329d8c7-1dfd-4168-a267-cc7fcc66aeb7@gmx.de>
Date: Sun, 16 Nov 2025 17:05:31 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] platform/x86: ayaneo-ec: Add suspend hook
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Derek John Clark <derekjohn.clark@gmail.com>,
 =?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
References: <20251113212221.456875-1-lkml@antheas.dev>
 <20251113212221.456875-7-lkml@antheas.dev>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20251113212221.456875-7-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Hd24InNMHYsyJafK2HLjNQbHbg3WvouhOkoERAdMF3c2SZLItWK
 o1DGpBLKpCzxvGCpeGjQyPxRj15T8/69cRRfXeS475mdML/xaImfMiA4UDk7cmah5MWdr4E
 wjxCWwOTQ+1cMMeDhab1NBTVx+mkCEPe5ge+XAizt3t8WPA1YOhflQn9PcZybY/p3AvWs9Q
 WPeJwpZ00dRXPuJquR5Tw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FEdesy/EFfs=;VywNKNsS2mB7Ae50gw51wg33lsm
 7lJWspLHQZHjstEhG0GseKxwYqZW3EZbZ1I/OtkQKxtpUPl4QUdSyQvryw2UFHM3A05k6qJ9H
 inJHxL8QkTcDBD+BGzpzye+MLRomkOb/1ScexXG4IFhgk7GoDWq0tIL7NQgyDe3qgaLmRv21Z
 y3vjLZIzZcA0dhXjLG7y3/JDtN+ojnxwc1peFIgVWkbybBQUlPg1/s83584sIBvh1CHp/6fRP
 qWODEJLU/O99ooUGq6S9e+ZjWslukTN4mB62Yj61Pdq2Bqt+fQg9r3gV9ccYNSvGmFE/AJCTG
 c2h+0erjr15kP+0K3Wpg7kltmAwGCzMNRlHmDHd0Wzzcqd8Kbqz4NI4D9HHSwQwoGouIv4w6Y
 UMvYjMl2EHm0Rfk7emDofILGYXZ66FraQABFnqVLXj6kAssabtyHW78GRCl4TPDZFCX1yP4ZP
 sZqF7uZLGW1FXIWMEpEuzUV9Tko8q+V4nNACF0zoUp4klSkH53+dhvUe/7Dd/hAIqxVM0kzvM
 AhcOwprsNm5p/iQG1RhexjdeOtF/Xs7A3DXFrOzoI2v8c11PcV+Pgrlha9M+KUp0zCCeTgrIb
 cntMFXfYf35vxuR2WyoxNWTnSpKAFngcDhlfM4BYrF13r8LVK+EXyrjij8PmB1cajirmzw6Sq
 p931Je3j11RgGHW2oz0STSQO4Uk2o/BKuQVW5xrjzDR+QYO/Ny2CFCJFIIjz0Wc4N0bpLA4nQ
 8XMHQAkaPsKkooobYDFBoE4hQ31fQa0CVj0n8XgzjMYfVBrEtz8DLoxMjko/DJXqCHGX10J/i
 4aD3xrj+apm8YAUT00erPgdQP3gsL3i73Qn6WwWNqzaY1iOEGwJm+Lv75mz7cT/m+CIG21+lD
 i8mhLnMeTl3RtLALJ4cjvaPknk2mf0ZZK/mSa55sKR8KGMJ0nEu/4Ir8r+hSReJhKVDx8IFOr
 7e+2tnvJopOKiK1mjCrKOa7ifadliV3DrUK3f8jDwhUkOeYAdAXSVv2adrWmV4qSB2ykkn2vH
 K5v0xcwVUfExqU+ORBYa2ukAz1TpGbS3iR8IXONypeqGMfCegS/AKDPwtELjvOdNuiGtW9lWA
 eXlq3TZn9rVtk5U3gPuUaHPhVB3X/sh5P/5pnJ8p6zi34dPgB4adSqh8W3+PgrO/FBjrrkPfR
 rF9aFuFpjtCyk6RjsFp+k2jMljMi9TSI3zRKyzVccuLoV0Ri6AcEtuHdjVH8QQTCiPChsACOO
 ihKpFw/Gg/WNoHrj0SIWTNNi88oqaNbE9Nkjlfi6GxSkPauw9ysMvqo8DC9/p7GSN97EYpUT5
 4Fe7IUK568sBuRK+TSkv9kIhll2y3plLsuVaBh4UDKv/KG69I/Eh2XuOkj/BRTe5ZHdzCnNZH
 /UlhxxJSNihMKSL23fcCmd6PqYtarIiMAJ26w1WW+unsimzgqcTHhJmfJ4wc7sftb/3YSHhSS
 Ton3HnTrGa0zYIBTkuf7yYlL6j0w7J85c9jE00LnPcghZr2DcC4rSL5vdd0P36ygtCP2kgvQE
 JK//hePaB1er97N1Azxb7ZGbUn/XAMkDHQNXL/P3jI++P2ANnJ5QTi8segegXzqYIzv4wOjJw
 y2FJNEbRZZrvXmewKA++y+TA8i8ernFUYhNQcjGmxvTfHGSM9WQxzI9Iz142goXOs3CSPCRRw
 7e1xhOfA2+NG31VbKbmTvUV6WVU31mPLbroBJd8E4jHHAJm4buqKQ0I3PCS2dLJo/25+2BrOy
 EbVyhWrX2ixlYTDCOYnbbbx9bQ+YuSLfDD5jv+lORikaohGnWfZoTjItq/cmW91S7qTJHHMSI
 +WZC+9cu/atZmasVBQs3Lyts15FasnlUz0Tqe9QJhXjGe//jAAIwsCB/ma2hVk+aHS/Zi42H2
 vP2VLNtosuus6jTCm2FetHgSlDZg+0AO5BhXaCX9ozwQHhi0Hdoo/xC+SluyTmTtnetgUsbvb
 SfTBKlqvQtv21YnyKDwkEAW2U26cEaEfjXBvn2ppce67f/Dq9vR35ScKj+K3BPlmOZI1CMp4z
 yiTAHARWqQwcEZbopoCNsjKhnU4BCHTYMaOBaejwk2X1kdnjSQBAxCxowm7AsBN8ua/iHoUba
 9MsWkn8dIQsCireE8YWHe5lRwTrAVzA5l5C4psk3zSZA/k4C9oEHEsghmCYMqwZNx/RPDHKch
 H0vpNP7QVaQ7PCjoyoX5Ndcmn9aEQw4wGKMajSefMDG1E+xdeCbpHRIYEt5j8SQealJxOVsE/
 UddHm8Uduma5M8wH5it0HWVdSHJLZbsEflYB5lnBbBMLmHimmgxuPRPn2z1qzbWl67oSL99Ck
 PuOVIE8ZsVbh+tbi/p/79AA+YB5BNS8Doa4A1Or9m/VuIRk9osZCH1nGJr68foGjka61pkg5C
 9FfxWZdb4d3WKqXQzzLwOT1KZ/LWlRoqBVsD66Bl+DDHIaCs4YEISv1q67KKu6yjqyrBKUhSR
 UTvvFDWQow4f8B7uRWVS54EjSksZuOG4xTSF2gtl5QCOHUVg8S12PG1qUYy4D2H3W5LXWLtGP
 zOuHU5SjWcnC/lH/LfSN2bLosga8PH6oTkt/UjfYtTmjaQdNagzny06alYhtbS0uzwrVOlKGn
 +jC8iJ96B050HW0TTsaQTVB87rMulQIqOWxSug78XxZA1NnJg+bDUzL4b91bPiPoFAMQ7gAU9
 OeyukmB4bPfn1RqcxesCOe1PteVradjpx+ChI295qhGzHsY29h6QLgpK37QpGiw85uwPoSeMg
 RLIjgs2RTXfzD+cp3bkAuAsWcKQhO3DJTahXtiqTYQ0eZ1Y0x48+E4kB5Lv4SLKw9kHTyBYAQ
 eVx6IIVXAKTyySQCFnPmBZafZQQDBhXQYuLhXIUnpUJlFDL6cUqYUfy4T8dg900hCqhUW7o1d
 Odfrnlw0sjgrgX1fiyLx2n347FCzrpsBkvgXxYJ6MdD3dR8P0U/JqOC77Fhwt1f7Vl44Kfl+8
 gj4tXLSxD556ic8Psqr69GuKwxzRxfs5j2oLhy8nXtQD3h/OCPcqhHuSdM3oeUY543rBuPwc/
 Wc9jXAwbx8pLLvvicCZSy/a4hYGzvoW6gO5b01pE9A9g5zWS6gCGiJrzK9NsJHrXGOH2D2otl
 Ibj1cfpOn4945I6lbfixc6gmOST8fkboIWD5DoZATkx1c3FWHPxwK9fmvIQhWy7jmKL5UwsAj
 2MkENvVNdYk4OAKtR7MtvH6OA6ZkyyYTEcjeQQuwOWJf0bNwnZ8J25qG03PXTYDpu1eps9hHs
 1KQUkCOj+IeS7EwGQcEbLpxpIaV5bJ9aV3zqbREw46mA33iRgwjVudMuvfmDdaSDouEzWwg0s
 akjYKgHVhqknHp796AfqtNJGm/9xuHQORDKFbIERJxPm15VsiIwD6R/ujNmSF2FjplMWvpZex
 CT9gO2hEFJNCqJfFPCL82shD+/jk7XOz5Y/PrkOa9PD1/IsLi5yD1RzHVqVeQY/6P14/4X3IA
 CfYaFMj3MR2pUPILrvrT9HuqnpOQ+ggmvLp+E5GAhHyanD2VLmRrQCPM9nJyymjdKOst+bJMj
 FICyJ6GIsVPsF3SYNksg7boeXl8SxKKvg3EJNXTCrZfw1VmZxBcobTB3HhUx/7oxOy26pvRGI
 TVv4z37U1OHn2Oq4AuMXs4JCUm6e73yNOqBNW5ZZ95EMjLYNBq7418/aMgeIECojC65jGVvki
 iVdaPgOkmVxKDz2MzyBBrhuqS2iRopvCSo3bXqPEcLRmIuZSJNzLTr9EUx1QIg3pK3kg3bjij
 nwiipuTodiXn6iCxYGf3wqltdSU+tgIQ6Lz6mgST5C5KXn5cuApsthSJM+Bu3qDpBadpmC7rh
 p5O82FOKiBoA1LNBDqatZnSeq65CqihxWVHXkld1GvI9zwk/9Xv5Ir1k4ctisMoIBZ1oxpAg8
 zG+8nQUbL/utl1ddc909jDJ+/O/V4bbEp8LgnKrkXG24qGkSS4jyRjd9WU2VjFvMO439hPz4q
 PuPb/O2QmHExzWb0wrjlfQaDBDZiRlv5yVQDd20tnW5RwLbj5ADMYoTOJjzLqeSX/CFV8sC7L
 0SQJYFLLg5dPuVCnZp8yWQT66xBV9I9lNspFX1t4CbLGx4B0H6H2Ecp+jsjiGg87A2QqBgR14
 xcOHbseMRzIhU22S6Wx/vo4/oMUXSxriUW2JaUrWRhM679jR/Dzp8qoNFsCiqQMgPSGx/Re0d
 WQtC8iPujpb39vcbkRNio1QnH6kNs8HIC0Upn1QLRs8tQFPtUFS/z+20YaVnruJbb2GfctO6O
 +2wq/5UDZlCAmtDg5YlOS5Tu9+/fxaqdJS7r7p/fVm+Hh/VwMwaB5Luki3ULzaVYWAJxLgDAG
 MQ+pUd5h52WFfkYFBivmIvZbTMXAkGqQygmbFxyR7qrY917iBhvlQiofxuY7YgFlKO6m6tU+i
 3BsxC3yWzC2c0WCEbO825gGQOWIn5/qFKhNud84SMaebkIvmHDBMyIora3kgg87451oiiEXAO
 sPyQxgkUb/EqzH0w/d850axUEV5SRA2lPTyn/sv4UuD4WEPgOP+pPyRJcrIJTllWwTE+IzdHm
 PqZgCEj0ccjUs/K+OEXUqJc4BEpvW0hwSRpmQd01f3LNnM9LAk05MMtU759lR8DaOQiTkNrPg
 cae7bPsd3SfTd5uiG6uLYAPFiA2GgeWxALbaodWfksB0P9ASScqlS99e4atXjDBpRS2LiZel9
 Axj6fy+3kSJy1BdQydISgVCYkceaWxUDk8V+Krppz+fPF+WktXdLR7450cwqlQPC2a9ECRYvv
 krwO54LwnO6Eb/X5bkk4XDc4P2/NpXjc8SFhG0KQv3YrTGDt6nG9v0Jbo4tvAmhzOurZimaAb
 XuupyPBjPCYvDv4F+kND161WeumoSt57sai+gzvYfZbjferxinX07KZBDgKppNqlAvryar31F
 /ZmMhJ6Pe3QQ4xOcPOAQFMoQzDhSCC7zGqP/FHorFXGWi8cycdk38mSP384AASMEkezeQXiH3
 8LNEnplUq/mTF9JfrvyX1mQozDcGwSeRbfI9SN/bFfur349UebpR3pUc8y3rBpLGu9REbm0MR
 AXpdTbaJpmjzq743QMY/5c+tNwGXmlgLAsrpPXPC7W2qexkjpUpNLNzfrA8V/KHH1rSp7l3qG
 1jkxA7DgnoTU4N+As=

Am 13.11.25 um 22:22 schrieb Antheas Kapenekakis:

> The Ayaneo EC resets after hibernation, losing the charge control state.
> Add a small PM hook to restore this state on hibernation resume.
>
> The fan speed is also lost during hibernation, but since hibernation
> failures are common with this class of devices, setting a low fan speed
> when the userspace program controlling the fan will potentially not
> take over could cause the device to overheat, so it is not restored.
>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   drivers/platform/x86/ayaneo-ec.c | 84 +++++++++++++++++++++++++++++++-
>   1 file changed, 83 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/ayaneo-ec.c b/drivers/platform/x86/aya=
neo-ec.c
> index 814f7f028710..3f40429acbd4 100644
> --- a/drivers/platform/x86/ayaneo-ec.c
> +++ b/drivers/platform/x86/ayaneo-ec.c
> @@ -52,6 +52,11 @@ struct ayaneo_ec_platform_data {
>   	struct platform_device *pdev;
>   	struct ayaneo_ec_quirk *quirks;
>   	struct acpi_battery_hook battery_hook;
> +
> +	// Protects access to restore_pwm
> +	struct mutex hwmon_lock;
> +	bool restore_charge_limit;
> +	bool restore_pwm;
>   };
>  =20
>   static const struct ayaneo_ec_quirk quirk_fan =3D {
> @@ -208,10 +213,16 @@ static int ayaneo_ec_read(struct device *dev, enum=
 hwmon_sensor_types type,
>   static int ayaneo_ec_write(struct device *dev, enum hwmon_sensor_types=
 type,
>   			   u32 attr, int channel, long val)
>   {
> +	struct ayaneo_ec_platform_data *data =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	guard(mutex)(&data->hwmon_lock);
> +
>   	switch (type) {
>   	case hwmon_pwm:
>   		switch (attr) {
>   		case hwmon_pwm_enable:
> +			data->restore_pwm =3D false;
>   			switch (val) {
>   			case 1:
>   				return ec_write(AYANEO_PWM_ENABLE_REG,
> @@ -225,6 +236,17 @@ static int ayaneo_ec_write(struct device *dev, enum=
 hwmon_sensor_types type,
>   		case hwmon_pwm_input:
>   			if (val < 0 || val > 255)
>   				return -EINVAL;
> +			if (data->restore_pwm) {
> +				/*
> +				 * Defer restoring PWM control to after
> +				 * userspace resumes successfully
> +				 */
> +				ret =3D ec_write(AYANEO_PWM_ENABLE_REG,
> +					       AYANEO_PWM_MODE_MANUAL);
> +				if (ret)
> +					return ret;
> +				data->restore_pwm =3D false;
> +			}
>   			return ec_write(AYANEO_PWM_REG, (val * 100) / 255);
>   		default:
>   			break;
> @@ -454,11 +476,14 @@ static int ayaneo_ec_probe(struct platform_device =
*pdev)
>  =20
>   	data->pdev =3D pdev;
>   	data->quirks =3D dmi_entry->driver_data;
> +	ret =3D devm_mutex_init(&pdev->dev, &data->hwmon_lock);
> +	if (ret)
> +		return ret;
>   	platform_set_drvdata(pdev, data);
>  =20
>   	if (data->quirks->has_fan_control) {
>   		hwdev =3D devm_hwmon_device_register_with_info(&pdev->dev,
> -			"ayaneo_ec", NULL, &ayaneo_ec_chip_info, NULL);
> +			"ayaneo_ec", data, &ayaneo_ec_chip_info, NULL);
>   		if (IS_ERR(hwdev))
>   			return PTR_ERR(hwdev);
>   	}
> @@ -475,10 +500,67 @@ static int ayaneo_ec_probe(struct platform_device =
*pdev)
>   	return 0;
>   }
>  =20
> +static int ayaneo_freeze(struct device *dev)
> +{
> +	struct platform_device *pdev =3D to_platform_device(dev);
> +	struct ayaneo_ec_platform_data *data =3D platform_get_drvdata(pdev);
> +	int ret;
> +	u8 tmp;
> +
> +	if (data->quirks->has_charge_control) {
> +		ret =3D ec_read(AYANEO_CHARGE_REG, &tmp);
> +		if (ret)
> +			return ret;
> +
> +		data->restore_charge_limit =3D tmp =3D=3D AYANEO_CHARGE_VAL_INHIBIT;
> +	}
> +
> +	if (data->quirks->has_fan_control) {
> +		ret =3D ec_read(AYANEO_PWM_ENABLE_REG, &tmp);
> +		if (ret)
> +			return ret;
> +
> +		data->restore_pwm =3D tmp =3D=3D AYANEO_PWM_MODE_MANUAL;
> +
> +		/*
> +		 * Release the fan when entering hibernation to avoid
> +		 * overheating if hibernation fails and hangs.
> +		 */
> +		if (data->restore_pwm) {
> +			ret =3D ec_write(AYANEO_PWM_ENABLE_REG, AYANEO_PWM_MODE_AUTO);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int ayaneo_restore(struct device *dev)
> +{
> +	struct platform_device *pdev =3D to_platform_device(dev);
> +	struct ayaneo_ec_platform_data *data =3D platform_get_drvdata(pdev);
> +	int ret;
> +
> +	if (data->quirks->has_charge_control && data->restore_charge_limit) {
> +		ret =3D ec_write(AYANEO_CHARGE_REG, AYANEO_CHARGE_VAL_INHIBIT);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops ayaneo_pm_ops =3D {
> +	.freeze =3D ayaneo_freeze,
> +	.restore =3D ayaneo_restore,
> +};
> +
>   static struct platform_driver ayaneo_platform_driver =3D {
>   	.driver =3D {
>   		.name =3D "ayaneo-ec",
>   		.dev_groups =3D ayaneo_ec_groups,
> +		.pm =3D &ayaneo_pm_ops,

Maybe you should use pm_sleep_ptr() here. With that being fixed:
Reviewed-by: Armin Wolf <W_Armin@gmx.de>

>   	},
>   	.probe =3D ayaneo_ec_probe,
>   };
