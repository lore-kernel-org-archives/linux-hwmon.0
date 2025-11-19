Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37632FF66B
	for <linux-hwmon@vger.kernel.org>; Wed, 19 Nov 2025 23:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763596471; cv=none; b=B4NW4Znb7Em/jhdqFX5hxLkYgcOrzWbZnopq7W3p4/MidunuHBaHAVfM2AW/BJJsvFlo+SdFBJedjM3RKDgBB34cBRsQEibcqbUyRAuqRLmaDW6obCng4s0wfh5URq5rb3tpKNbS2B3XrcKEvLkXJpZQVqN681ijwK0oLXPMJOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763596471; c=relaxed/simple;
	bh=IjLMcwHUOcM4JICLBs000vPRy02RlcfrXo2g1fbd1mo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xc/Np53yt/U9W6HWjyoj8v6x5zqh1njlK5X3OmsR4vleVgFmyNTLMWVv/Q7+xaw5EeKN7GzhiVwBiAJq5mzAGkvcB7iwpyfEGJw0xHBBhN1CnufDI6N12xX/ogSZmWkonhvlkicwzKnbmHIDpjz11EoMQveiNmZDe/9OquxZ2N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=OWQPXv8W; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="OWQPXv8W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763596466; x=1764201266; i=w_armin@gmx.de;
	bh=lkn/6LbXwMtB32NxnZbTwR9CQIfVvXAuSMKfXU9jF8I=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=OWQPXv8W8RqYrAA7256JEGDWZDkRKCp9fyVfk4OLwptN7wUmbTdaDHsTQub7YujD
	 cup/86KR3W4JYulqrwQq1bKS40mhlYaexXBgHNmKTQ7lBUAmWN0ltGS7RTtR9pKz4
	 MaLyP1dHgjjOcKZcvidJR5e3OMq2YEe0/wBz/c2o6qwXqIgu+0/ILeBvSn4GDYdFg
	 1M0bPzu9tkIAkrPQJdyrTdzuR2aIpZofawQ0birV36xeb9vmhLzg7IBH012T8UT/T
	 bcprNvqK+ycn8i12IqtHqw/DoXDUsL1nEFrAfssRIBSy7L1AWihn6MNsE29AYvIJ7
	 f5mSaJ894XwR8yOnuQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4z6k-1wKTOn2mwe-014uYf; Thu, 20
 Nov 2025 00:54:25 +0100
Message-ID: <c5151e1f-cdf9-4d58-b00b-433f877b2ab3@gmx.de>
Date: Thu, 20 Nov 2025 00:54:24 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Patch: applesmc.c - update handling
To: Jared Mauch <jared@puck.nether.net>, rydberg@bitmath.org
Cc: linux-hwmon@vger.kernel.org
References: <aR5W2K2Ic06uPgBy@puck.nether.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <aR5W2K2Ic06uPgBy@puck.nether.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LO/Wi8r7uKcvkJAFMCj6S3A3FlmgX05i7nGpS3dFEZMjoqxu5YW
 Dd1osfIy331utKH39vCHNA5JHxRTwY8CVdpAEjvLxUwTrqdDiFwJVVo3a64VmjvmvijIVPc
 hPcCqxbdXFZ/YP9x8OlRE2QiO0K9T2CENEmxTjv/6x2/QymgdB1mGFUbV0M7leIq3NABfbf
 N7h+t07eVmy0xKrQKmGHg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BeTSrIZZ2zs=;Z69IcyjR4zg7NgKUh3FFpjmz4w0
 54EdU63NDcP/HoaID75WA9W0JGS8LqqJVELfKxoNhu9td6qMqKKIpqoeoDBAL+tUeghkPvgJO
 VHOJSnjwuKYqqYnKEsX3pdy2EFVDu7bCINZDPRnlLNNUogT3DCme3Fmqn+SpBJ6YMY4JSZjJZ
 1ybr0QAaIdd3gdDTKdd4XeMm1IFWbT8ckQ0Q8vr8xTtcdFZRXUeceIna9BN8xt3M5mtke3td5
 ShEPGvbAHD6+akHFhw3Hya76wPEfQlduoMPrb/rW4j5bcea0eFC1uquz46xNmEaD6BbTzQQa2
 m+qWG27+JG+YnSsJSNsrOnxbQnrtwRIqC8jkur5zWyNGiXi4UL3lSeH9z+qNZ/IZgSfb4zIwy
 tx6EBcKBHUWd0uTP+30jT2WtX2AsYQohLTlSQlNzvcWbDBG9N+V12G+4t77h6NISW0yZOvTfq
 YUA/+VmyqZfyPoJ05d9FiwIzJrkzem6e6iigio57YmkTd+V8Xl5xfRo/2TT0pMMOIjHYIKZTJ
 BluVibycZxj40jSXqb7gkh6zYia4aw1HkXrYWVIw1FxgXVFN9Y21JYPKtn1AnYGo7DZ72ycIz
 DQYt1vVVrCytb7PPc7xXjSpCyZhQi0cs6v3tpgmBK+t+gLHqdOSFkSCDlap8uut6I2RG0Vfqu
 OHVsr1tO5bVjMLEx6/ZBHjslr7n087NlqtjEegEJ3l+aADeVWjQFREDkPKki2KHaanekDb+9g
 +gGcCrwKzlAJeCp6OHxP8aZJ1VBWQKcwJP21Tr4ryu2+JNy8knAdgJK8RpcEuCMS8RSJppD3j
 y106cd12aP/MaKbD2X6kPfpa6hxu09d+KxthD0cEQMTWDfh9AloRoXZl/bjAFsFt9CDOagAeD
 +28GOKD9xNIw1BM0c9lWk2GGHsg0sgL7BeQKpr7uI9fFbovIi05DeX8GuCekbPRU7+GIVyN/Q
 D5PHbJvYBB/YXCt4V4uVVD8ZaNKrevXWtH++tPZwqq+TKtHjDPCJgusngspKCyewRsnlAS6Ah
 /in4wW/kBjeAPM+QC/ZW1j67qPi9cNP4Gm3eP3j0+numhTDXLDPeEaxtaM0MMTN7zX3L7nkuV
 d4hd5+LNV1SnLZlTuFbCLTMXeLhObljaAoBSlhb898hs1ycb18y700V5SNcUY9yytRh5V+8rK
 uQO4TTvQplJkb/jx+vDTW3YKJi45ZpXqhfnfz0zKNfos1HcAAwbrj1CCe/qOWmNBntg1JAi37
 sHUUnhbkGOerfz2igJcHkaYTKJNI0kuX6HV5si3JiJ2Gr42oHUnC5V5HGgI/y+EC2LNYoXdL2
 wdlaihsc/7LTsXErW8PyUhRcYMEY6ZWWZOhVxDIuBejQIBHsDNJ0C8bKMj2lGp+xeVQhbl6mY
 BFteOOm76Bwc1VOgS+0kgnzFxc7moMGs1vhaZjIW5+3nbNLhaI+aOwqI4gCDpd4VB4hCfQRvu
 dn35pQMSqnEVaTW6f5bptqQR8Z0XQuMcgz5FB26x3PRQb1JVkNedST8KtyHWCiufMKbF23gfU
 U8HWCotVQMr3lsb1T98YrtCPGgQXA2uCMLoldtTOrCTMD/59blW35kpfrXAHLGAAdtEhz/9kY
 C7w9tfz/NEOA8d4rZ7TbysoRLQLrxJrFghyylPPP1ecwWhA9DfOjA1PFZfC4aI3U2EOfnrICl
 A5UkzyXbfOkuWghrzuKKh+nplPdEJJpRPpCF8HEh5M4VNxAYuoltxLUy0J1KAP16yzqHSqvNK
 n9Fi23bTYCzawYl1oryTjvoL25O0O52A644RPPJmmxs1PTBiLZv3/2YK8N3byn/fAoV76E3Eo
 ymmVaia5WkusDLEr2AB0xXuvmkQ6PsmNB43hsmulxlHIVB872qkqVFwTaNLBkWIQAJz+21978
 QQGTvde4R2JiaKyKgskgT2w9Ro3Lt0z7Sd1fvF1yELfxuBaVc8wNNGogRXNDmCzSogXoDmbtI
 T8ulz0AUidgNmX5k200CB6BmaWZd47iPJzgWuSGZQscAvAvWEciVJqHzd79GXLTxqa5FcLv10
 yv1vIwUJCDxOt5k1+ed9QWt1fx/L+SGALj7UcusD2rzzcYG7mC/mpgxvcvTfSP8wh18nI+/h9
 07QfTSerOAE/41wj1o9XQgdNpfbtK7shchL/JGYxglXWx2h15Hwg3h1V2IglKvSJuWRS4fsMt
 sHlKLq8g/jkkUfB7saKwhTTcOnsDO546D7e6rc5ooQC5wljxjvsbSZL/WAfkarnnB+oEMbl5s
 xwcHYuDuZMSVrI3j/nuEZoRZjpLHvNUiEsEwNTtGjMlSqshyAo2GweC0c28/x3YcDPD2W0OtY
 pvE2VVX9VTAcTdTnvrvx4Hkp3bQsA+ghzkEY7sh8sc6WaYrIlaM6c1JAB44yDvsJl6v+L1qbt
 Qq5AXep2DOwaqwy/NQoIzdbHkpHOXCwAyNBg0iE7ZtyWLhcJqJpZ5tDyWKd/8E+qGHaptgx+G
 ZtkseIyW53e4inSzzUF3v5u+3ppkrZW7QNBebtfY9fhgNi68b1B1HDRcHFLpnNVnhdm4+Lj2p
 LKTKUFIW7y2Sz3rKgdaGprvuYzc8ixP6se+xVgi3CK0eRfhRBzVJBHD6f4gGrlfKOrhW/cevH
 bLOGdM/cCRZiWzgBOi5lz0vtdhDMkscOXyN+CHwtT7RGG0YT5yKTbGIpIKerLJJTQ1xzwS62U
 FmORt+0GPTthy5ReU030ROk72YrigWcV+BMdxeJ34RixbJGz6Jhd3vEY/pO61WeceuaYxjpQ0
 z8Vjo0Ff4sYN0xy7GAtYRUTRlzztoxX6yeQElx3INxwY85EvcZ8YHYoW7tVOgeDECp827G1qO
 mdu2747XnxD53nuE3AKaymkSJtvMnj87M2uEE+NfSoN+l/+C098ks5iOxwZ1ZNerEBP75nBk2
 cKBrdLCKHB7E561bNYYH/+YQQbtfKdkHS6BZ9u77myRGYVxM+ajZFlbuhphCskTHcXvFgElH/
 O1stSVXJDVO4tHWaSnkNsbxLOMamNP1/7wfSFXQITUMPEX0eUbRKSbbrFgtesYrm1HfnRE77M
 YStE04vy1JksAb8AKIDylyz0n/3U8UQ7nSkDpBgK1OQV3v++Ha7q6UQVJtmddU08shOrDn2+w
 QsHXR1k/O+9ypLRypCWismLjyFoJNIZ+S67fo6NH69EywM7a8UD7FtLmo2wCF4FAEQLSjPr+P
 cIm/5qvJ2CSRiUzmqDDA80XfspmQT7GOeH1IAweAILvNOkTMNIts2VLJroX8ElTu4uHcQGayE
 siw/GQeOIwiSUXNpI1ZgThdqII/Orz/fQVa+1U0VblAFxB+0jmfUXX1lRT3ZAMywWqvuvNnda
 xCouvv6lo4QuuKoNXuAflCISVbwFnxXngvxp8UQUc8Tw+lciKE23Q0Cb6luzkw0S8N9Px/emm
 VwqwyqTyqOzQYGzPYJdgDO97wWdPiNQMhEp6+gsMukXPLSiWbLkyA1uvfEJIbLz3GUs0eulsL
 5wkYwg2TAb9XlHd5M+XQEz9943FRLZeF+COZ1MzHpH71Ny6nmIKZQN3Noi8eyjmenfPn8gmaK
 bUQo5ljUKIe3lDRcciRsKBFwqvg+n+nxkHCoL8vGgSXsgsMkYbQLhYwCqli0nsMDOfgkr7ASq
 Tzb4JIn2DexEx/2i7Owcw1wTS8BfwEIHua9P1qNdYyonjl/sD7MHR//AKoPQJSlg6gXZ2SNaJ
 rS57Kp1CXR3Ucb49/U0z4Rt4l+wmv9zXsRt67V/1ivxL0GpyTIwmF2SUHps5OyR8Kt17EzWtw
 7J6879QrAVMRLfTZWwsFYzrzmkqYkLp141VSOShESc/wDZt0n0S4/YuKV7twoxH7VQdL9Xq3w
 RnEdiKvCQ6TvIb2ddXIOcrF9DF+5GFEyOyIeDETj697+9ZBDfxI08aZcmZ6nUjowW33rxdf1t
 dlcm4EUwh8eW5XapdQvWERzNUyWcxFH64XNFZCWjNeTWEQyqdsqxyzt2S/kaPsVNU6qnyjHQn
 GMMIlGH4KMkEurc6dqrYZJ+NVy2CWZpzTg78C90WMptDexF5Irh/qaXaKbVUdP2INYLw7FpGO
 YtjCv9gJgPi6RfOExBNK3WxFBKVust7a3W7qCSK4HPLDU2nNehqKEoj/by4xfvjrzz3i7PXQw
 WLSifSsdTM8f7ekqDQSPC4v6gt621IezGp1wG4aiNZP7wXgVf34/xLZ3jkA0PG9ikif7tjrVK
 ov5gbGOyYLq8aDSzlzK9xDnPZDxzphr0Ep0pDzV+0iNlJPO4oZ+zE1/KoiWY8vJyWgV60cpr9
 /4kfnR6De5jim1csmLrCs9msSTlMHPAZ5o33Uv55OqgKKuxcrtqdWrzax5r6ghMna4Dk7MvdI
 eJKgpZmER9/fRHTQEdHA5ABToq9YJO04H1oPvT6mDXHNQBMxEkC4JrMkW36etMBAgpAahCD7C
 Iiz4K8raJ8Bm94CIWg8mE2l2g4SY/WtUwugl6tq4jDDmY0l8CEYsZYDKEK7RncZKkxHboLOWO
 aZ9hCSkHiZ5HGWiIapAeakIQVj9Ritqmx55rwBcf4DSqOhLSL9muGeCXNJBq+4Ysn/JHyLClF
 rHKrosEmGpJt4ToJZ8RuaTHLHUk1DMCnTIzgyr1idbf0i+ua2/xR7QvYnnaOPb6LGDh+pKs4H
 3DkYqPxlfMnzjdfXoNok/RGWtJASX5/mMN5DOZDDFGOwiV50Swf6DgRLrTziXulr++5aGIel9
 GHwshVm2x4rVVxIzubEOA9BZHvDcV7rnPDscRL2LoZYTXoibjowGSIGJEcw+lAnsTfjuOQ3R0
 Me8XRJi5vtygVloRokVAsOmDsXtDA1uBKrSCNFuV+PA0NfjiQOJSnK4+cXdRbi7S6aOT9VdTf
 1JixFtiuKINSSspsRF0Rk17nTWNhA2jfTS2J6ZhxQ/uYgGcBnSWi+2L5BisUP76bhQNeHpESz
 i+LBdUAe/5tOF0I0MkQwV2hnPm0lgVi8cJmTnmQ1TCPEQgySZgGll2Z3WYil2u2TV3pfgCm47
 BPfc0s9DIvs96kZqGmVfhVRcJn6py96k1nauo9pGSGHpLXnsIInBLxva0AgqSIUGte5ahmc3n
 VnuTtzHVaql6KQmlht7jWf3t38aQzFkFu20fQBF1+RS09FLwQkLECOuOVVS53KDn2KmPZYi5M
 OFaY8y0wdXXC2dvVc=

Am 20.11.25 um 00:46 schrieb Jared Mauch:

> Updates code from hwmon_device_register to hwmon_device_register_with_in=
fo
>
> Signed-off-by: Jared Mauch <jared@puck.nether.net>
>
> diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
> index fc6d6a9053ce..984dfbf40233 100644
> --- a/drivers/hwmon/applesmc.c
> +++ b/drivers/hwmon/applesmc.c
> @@ -1362,7 +1362,7 @@ static int __init applesmc_init(void)
>   	if (ret)
>   		goto out_light_sysfs;
>  =20
> -	hwmon_dev =3D hwmon_device_register(&pdev->dev);
> +	hwmon_dev =3D hwmon_device_register_with_info(&pdev->dev, "applesmc", =
NULL, NULL, NULL);

That is not how you migrate a driver from hwmon_device_register() to hwmon=
_device_register_with_info().
You are expected to also move the sysfs-centric attribute handling to stru=
ct hwmon_chip_info.

Thanks,
Armin Wolf

>   	if (IS_ERR(hwmon_dev)) {
>   		ret =3D PTR_ERR(hwmon_dev);
>   		goto out_light_ledclass;
>
>
