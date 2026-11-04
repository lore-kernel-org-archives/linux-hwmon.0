Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781453;
	b=BOhy0JIDs6qa7h0x0ssESg+ag4ghGeKiDTf3fgoneZgH3oQg7fFNbENVjR6pc2kE6hwH
	 36z9CcGTjls38V1JGfChawU4XZ5YjhbPnl3HzdkXAVaKIQ3K5424AwpPFUiVqoVI2NCxd
	 1MrEZgrRDInML0LXL/jBX2f0wISJFo+X2QwR3jXakhWF+ZUV4FmR1bLDD2EC1PeQfSwqa
	 lazfxAFz79IKPi1jSfsE2enV9KsXw0iZBX0FCNDcHz60u9T/ismfrPRqzB0Xfd36y+qpc
	 oZQIvW1m5/Dzauy/PSyuBL2xZONeHLIBqB+ZBu/UChKosp40OnGIsEkPYN+Bt0pu3HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781453;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KVKN9kg/Uqv6XDovB+Zs1e25cxjcx32C++i9N3htlzs=;
	b=ePIzevSobMjHD4Aq/+qHx4UpKzZLPUppFMEMiQINYuuA2CEF0xlI21UQ8MT9MPKMBo33
	 b8EHxeF8FDd5RxMWiI2JpcHEdDCO7/Lq/mbyKGZhn5ZzgpbRXhQ7wT4s6xuSF50gdK5ts
	 5f1ONT1wYpsLh0oSmxttPwUkEFoWn/xEeD1/lm+MViYaon6A4Ug+gGhGJfH6o8v0FD0ea
	 AHM8MEkdT8p1SxqTa7xjfZjCgMPznkUKLONVceYGMq+0JqhVC/4ZHgE7iQS7vf3z2lU+F
	 CujutSlELhyYOIyhIHheoFJY2SG434DKekkMFbqKV/2t8xO7BEr3ehVtbTX4AzW9xFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZklL7L7Z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SR0beHqp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55B1606A31B
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Nov 2026 08:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E55B1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZklL7L7Z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SR0beHqp
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48Kix0175447
	for <linux-hwmon@vger.kernel.org>; Wed, 4 Nov 2026 08:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KVKN9kg/Uqv6XDovB+Zs1e25cxjcx32C++i9N3htlzs=; b=ZklL7L7ZCWzQ2sZv
	tFpS+HVTme9ImWkasA4By92hM/ckOxk1UZQ8dB8KKqny2rV56YPm02nuXkapFpa0
	/93w5AX3YB6/kSHOCKGY5PMWQinMs4bkaFtqyLBeykadLqLEb+0GHIvAN4/XKl42
	7maxi98XZ4EyhRQc+FU78lpXJr//wyijsjg8MJ2trwdY8N9o3d5RJ8rKw/TUYhfN
	touLwV6tCFBe12u0myVNKQR2g1hIOMZBpyE5Jhu+leDxLqJSWcbAdFm6J4ihWtLx
	HZNV3xfDGU9p6alhIBG+iplWJVDNRx9hMh7P4NMH+uGiFC9OmsYdeEKEshaHsiR1
	+N0GzQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqmjbu2j5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 04 Nov 2026 08:37:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-536708d1a3eso1382741cf.1
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Nov 2026 00:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793781451; x=1794386251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KVKN9kg/Uqv6XDovB+Zs1e25cxjcx32C++i9N3htlzs=;
        b=SR0beHqpbclrsxfec93AMxzw9QKXVpjS1WpzP218AT5Xj97T0x+G+ypmj3Va7cZ1kf
         ZLgqtCK+apakHbojRjXVq2AdVQ2eZy7YnfL/XyyJQgEuFkAup5HZKe65T+KaGMi58ouo
         oOKVe0XBEKHuo27jOimkkcS8+vrv65ABsmRNyDDkKvbygb8MxlxCmm1viHvgIpu06TxX
         y7kvH0OjSsDp5pt9StUfaYprediGs5fDEwf/z1pXcr8wXRbKfAOrCMsjL7VkeDGaLKFg
         u78OhaU+74FfVgF90IIg7vwee8Eu5cKIx7yh8L+o3K6cTCktIvl/+/0c/YHa4cIJ2SV+
         K0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781451; x=1794386251;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KVKN9kg/Uqv6XDovB+Zs1e25cxjcx32C++i9N3htlzs=;
        b=HMulRPKQo4yD96VeX0PrzHsLIhqE41+fGPjD3Uu9wZWxzyryw9z3oBfwzkb1th8CvE
         5wvbxIpbSrhDQC0w6mjm8DydY6Kk1UVw0s2S1bq+EA9bgLslvVQIswCERThcwkUHEI8e
         6n3HwNu6sY4OV2bYe+2OIoHfJC4Ye+c2nZSoa8kmN9mGDZ/bXbXGsF3/PQKQBa+eBq6b
         zcoS7aPOMH91ipIpqgplMd2azMO2IObTNBjyW5RBjGqAECLRSVucwas5ITPzCpJZN4tN
         A9Rn2r7xADfP4Hi3BPobrIuA0t1in2EuXJq9yCgtXGlbsEw5SKxC9sy6+SiwZOko8jf8
         QsPA==
X-Forwarded-Encrypted: i=1; AKwUvBzyA/OmwoOVn1rbtWIfiuYRaT7DUbyWk50H0DULX4uxSYh3fJkAKZnUVeXbvS++x47FycynZRJ2UrTQ+Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Jg9ktcKiWKEZnM7ak68p7fZUKJCEVVJNfbkxJgv98M8cUR7pl
	X7P10q69B8wmUJq0gLDB7/ef11Zkd2lOeipGiUnuu+M+ldnN5SBzZKdnVt8hqcxyRLvE6ecms+V
	KBAatF5ghnDxE/DHb/rilTm0WbKJAmaWDyzQHHqWbpNEvaFeISqolDc/PBRz6irfGHA==
X-Gm-Gg: AYBFou26rzebV42HgFriT/jP4dEroem1iIkIOm9T5UGMr6c9vzWxYIDK1/aDmBTNq/X
	7XROvKJQHIc6rItcqguA0PF4petIVcxpUp33CeMaICFLiEQmwY6WHFhCWeJB+ptztv1HZhtRFgA
	gKraaRsvgxGJ1YORvw6qBdmTjnEnxqZlwzY6LVu6FJ/TweN/O2QWr3T6QF1/L8AdL8Cip6RjSBJ
	a6X6YIW/D5PAqbWA6IxZJEoKucMRj0HaxjFLKBChCXE1/PIW1cUCnsCPixlA2sCiOMXNJOuPwIM
	ZpF2exSRXKrtyoUOhx60MoCL9CRZUHdKG0qjReSXM7VgKJ41V6HbEQuq1QgAjgPDji/ebI9Nl60
	dMjW/8gwnjB/VTbH6Q0I2gTLFS/qEKB9JCmbe5ZsvDkCJ2rfMd8mpmr2WBCICNa1Fw4kN
X-Received: by 2002:a05:620a:cd8:b0:944:12fe:c8f1 with SMTP id af79cd13be357-94421367ed6mr2481150985a.0.1793781451220;
        Wed, 04 Nov 2026 00:37:31 -0800 (PST)
X-Received: by 2002:a05:620a:cd8:b0:944:12fe:c8f1 with SMTP id af79cd13be357-94421367ed6mr2481148285a.0.1793781450641;
        Wed, 04 Nov 2026 00:37:30 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55abd5569sm538339a12.5.2026.11.04.00.37.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:37:29 -0800 (PST)
Message-ID: <a759d346-3fea-4a01-a80f-de354746a288@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 09:37:27 +0100
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
Subject: Re: Kconfig dependency loop LEDS_CLASS -> EC_ASUS_GLYMUR -> THERMAL
 -> POWER_SUPPLY -> HID_NVIDIA_SHIELD -> LEDS_CLASS (was Re: [PATCH v4 2/4]
 platform: arm64: Add a driver for the EC found on ASUS Glymur machines )
To: Mikko Rapeli <mikko.rapeli@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-yocto@lists.yoctoproject.org,
        Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
 <20261015-topic-asus_ec-v4-2-af6305ffcb10@oss.qualcomm.com>
 <aursRfQRr0AOL1Oi@nuoska>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aursRfQRr0AOL1Oi@nuoska>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: S8i6tFwtPkdM8i92SrEzbw-OEk4zTsWQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNCBTYWx0ZWRfX67EFvaB9HOU2
 NoHm4aQyyH8hQWs/YdZzlzWcacNBKT2A0ice8C2FC51VED6fXP8b8VP6/7DUEg67S1HHbTvsr0S
 i8QMPgq6A1G2jLZzQ5237g6rPiuTVGI4dWSeJmB8E7ek1xrfKarKBbDnP3Zle1fjVqNsBRZ++85
 JZ6RkcIIazNM6MJRvL6LPjBo6cvWfZQ6CnG53V63GP2BUP1aq3oyMlCiwKXyQ9EZX/Eo9FOIACl
 AG29/Zj36Yw+RX8ZT5H7agf31sBu/WAyorPyzwZDm/VaI6Vd8gLv70F7E9Q/RJ2UmlCUr34kXI6
 +SI8UyEaTSLVPfnLCe6jTAyKrZJeoJdHh7DIsQadroEMA8ylWNx3F/TRRbZOIP1/tSy3Z6aP2ih
 Z7HcRye+dHPz41kkOmiZciOCNgejsSq3LwIN3+b0MtRvxTpZo1z4VgXxlIb7djqCDkjeTT4+VOa
 pd42nZWDW5CzU0x6G8A==
X-Proofpoint-ORIG-GUID: S8i6tFwtPkdM8i92SrEzbw-OEk4zTsWQ
X-Authority-Analysis: v=2.4 cv=NMhAaE6g c=1 sm=1 tr=0 ts=6aeaeecb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=WnbzyOWOUeW_Ihyr:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=iGHA9ds3AAAA:8 a=dNOK39mv2ItteVrz7R4A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNCBTYWx0ZWRfX4g5A2YnR9wG+
 68VIgaWwhOZf0CES8yVlPu9tRJFuRK2kfOfontyPeEmUIbBn1c4xRxTH1UFiD2tIrDZWajW5yKD
 QCR1OLkoCX/sV9p9CKXl7SytIogswos=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040034

On 11/4/26 9:26 AM, Mikko Rapeli wrote:
> (Adding linux-kbuild@vger.kernel.org, linux-yocto@lists.yoctoproject.org and
> yocto kernel maintainer Bruce)

[...]

> With this new EC_ASUS_GLYMUR driver in 7.4-rc1 there now exists a kconfig dependency loop
> in arm64 builds:
> 
> LEDS_CLASS -> EC_ASUS_GLYMUR -> THERMAL -> POWER_SUPPLY -> HID_NVIDIA_SHIELD -> LEDS_CLASS
> 
> In Yocto distro we use additional tools[1] to check that kconfig elements in fragments actually
> get applied in the final .config etc and one of the checks is for dependency loops which now
> fails with 7.4-rc1, full log below[2].
> 
> To me it looks like EC_ASUS_GLYMUR correctly depends on LEDS_CLASS and that enabling this
> driver by default on arm64 with LEDS_CLASS is correct. And also HID_NVIDIA_SHIELD correctly
> depends on LEDS_CLASS. Thus I don't think the drivers are doing anything wrong and thus
> on the Yocto kernel QA check side the dependency loop check should be relaxed since they
> now can exists in the kernel tree.
> 
> Do you agree to this or is there maybe some way to remove the kernel side kconfig dependency
> loop to and from LEDS_CLASS?

https://lore.kernel.org/lkml/20261029021330.460192-1-haiyuewa@163.com/

Konrad
