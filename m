Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795698;
	b=Onqk4crL/u4bakA9e3L6CUFb6zFuyn4ZmdgNqomlIku6VS0vKseHhDcPFuiokAoixPRx
	 X+pz+ZcA7/4D7nZ0YgOtq/mHThda+3k2D2ejKR+Be59Kipc9y6E161976aR9/iD52TXQQ
	 16Uo/23uisdxj0GC8BIGtDnSGAHvqsYi2DSLAUmobxZCEpUSo4y/X9RXEzDw0baYW7Afs
	 HGYPgFQNiF+HO6w9BolLfgX1a0kNlYJOen+MkuvJ9MvgUUTMZvYNXVlGXipI/EwvWzR1f
	 ccug5+LM7NqDSIDQ6+ldyUtgHT1FErhcbjyli/eAavD6mCwmWX8qwLBE7WWAQSzig3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795698;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sds1MGBA7G+Tt49HG3Xil58EHIRS9PXgqNLiElDB5ps=;
	b=3ySqfcHggC6g2PD+gue3rwy8TpA0jSYVfWzJ9VgVUDf+8QdUDfnjZtAF2lpH+ifKw+Dk
	 uxlZcURt+9CBzzb2Rs2G4hW0TrwstM926fqxl+J80OHXn19yerfQ4Ke4W+pv0IGHF5z1K
	 GtY7RCLPX4TLWG/Be24PhlJNTMA4ismHgNhMYX1PKP4gQEf8gdDzudrnJcP3TpR75eOsT
	 xCaL4KhcqgWWDVEYr2KqZ+DfoG5g5E8UjWi+RW3wSLqQYbk9C9OzXQ7PiP0jRyi4j9f3U
	 bhItU5erK70PWqodDX5zClhhgEAsEOfsgy+/r5Oct3y5d+tuVXzlOdxKYb+vJwMJVrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pOfqafgI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="dpGhNB/x";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9CA606A31B
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Nov 2026 12:34:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A9CA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pOfqafgI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dpGhNB/x
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BaH4X2729115
	for <linux-hwmon@vger.kernel.org>; Wed, 4 Nov 2026 12:34:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sds1MGBA7G+Tt49HG3Xil58EHIRS9PXgqNLiElDB5ps=; b=pOfqafgIiyQ3bF1F
	wCGdEsEymDm2DhPxE86PtdcXoDmoWAokBuaB+EABu0eo7mt50FqVGPRqsTkHmgxn
	h66k/NByR5wpJeHuR7omk7Gdp+cUFNDikpZc2tmnTdbTH9GggWJO2n+Pd39qRvXf
	sc5te/+SfEZihjhJElibGAhEjxJCz5P8SfKBSc85bG+DnxIHgrMfWbbRZGloG2Hi
	s4bNDBAFsJoQf8qgcuU1CuRq2a/UxdsE2wBFL+cKkIUg/PWzjqE543GAy3BQnrh+
	MwLyEeMDsJcfk07SDFx3sjeyORqaWjK4ni3lxqj5y4CPYWTsJ5yBmLciC6tJtFVK
	zrV7YA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqpuvbceb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 04 Nov 2026 12:34:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2eaf3f829b3so6077625ad.3
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Nov 2026 04:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793795696; x=1794400496; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sds1MGBA7G+Tt49HG3Xil58EHIRS9PXgqNLiElDB5ps=;
        b=dpGhNB/xfvSW4grebQtPj/ZQrkIen78I8JiGV92g/WX/oMcACV1GJ9fl965nHnQTp0
         JyN4/Qd3sNHUKhnboVUUZCQ7rehlIIwRLw9C6h9loCM+zCDRPmyJN2GU0Yl/L3Wxzkim
         EzPQnMw0xDB8OTYSkycL2PDelqiJOK8TJCrQrLWZv+24dYIoZzqaS8qKSWsvDMxSsRsR
         u/l/L2kRszEwQBNPcSJHNX+dtTp0I2ySbMo4Jpou8v2+E9oRJ2XF9xXYZEFFZgS2Fzih
         kUukyKBVwtlAYe7Mqs1BF/0mGCRc2Smw9t9X5c6MgvU2QMTgNn09/NNr3fdQGlI3mrrz
         eMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795696; x=1794400496;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sds1MGBA7G+Tt49HG3Xil58EHIRS9PXgqNLiElDB5ps=;
        b=BSgw+wTvQ3Kfn0SzPNa12NVJdnKW0QcrIRd9+fu/+UJFCSJYB5BBRaUM8HJWM//i7M
         yYFHWFrA1IJKBO12Lb0rb0X6hLsn2YDEOMKhho0ug/o/RpSQPXE10iR3bUI2UNzXZpQc
         YyIZUjfH84NiUMD4EO5+GGYaOTwkh4veZHUrjsQwWp/aO2rqtb3OmQTVNCWS466ZAvAo
         FkZITVctiwegRNoyG9LrxQKMk4mmjr/rm5yBgrd2IgM8umBIdehnvmwPEORmu/a4V361
         2wkCHqzJJ4PzHKHabq59jKAPGck8rEw8PnsF7FSsfLPmpBtmELNTSDWEh3MVGznnb2tC
         TWhw==
X-Gm-Message-State: APuU4Z9f5ZcReZ+Pl5I/WS9tkUj3fYxpnhRRVMQTygQHa6oLI67epW7k
	+34FZnMSYsTVK2gG1JPncZ+6q57FMdAdN11mZJs5413vYFmTToj5ZbX0ye8okeb9fptCG5XarBE
	2LJejGv+ACp+NjBgSR2aTOeuC6nugye4FizjXWtjzkfx4pARUIgpPxjbXtBZJI+JRCQ==
X-Gm-Gg: AYBFou1qq+WfL17wHb8YBKgo50Ua2xLulB2P0z0TRHtmCyrJGnDy1MphMfuIgrFAi3R
	WxAIGHwXoODrMybRrKtSPlP+THgwI2LmdV6CpclgI3wnY95PWsfgXue08+dGxJVjmywO6y0qhaB
	NIVxlwq3kHFj9SOVevifcWXfmJp4WEiWjxWgIR0UUjZFcIBfm+vr3ITxOxyP02Lj36e+uhjdWW7
	mM72bsLp41F/vCAZ71vk/CmJ0bdWyw6kRdqKjiGFYsh2Gm60i+AZUL4+T5zXyd+5R5Siy61uAfz
	LnPIaB/CIhj57F/4MdUbPoJMt0gbsCxAOI/hipXEy59DlHzHKx/3LdQJ8FDMblan+eCxUJBhDuS
	HLGLu5tEFfnMvldX+y6TIv01BOraGnYn2TfqXKL58a74SznFuY68r40anv1x0ytHPH3cwl884lI
	xkEVZ5Ng==
X-Received: by 2002:a17:902:ec8d:b0:2e2:ffcb:87a9 with SMTP id d9443c01a7336-2eb3642fe66mr137002355ad.24.1793795696219;
        Wed, 04 Nov 2026 04:34:56 -0800 (PST)
X-Received: by 2002:a17:902:ec8d:b0:2e2:ffcb:87a9 with SMTP id d9443c01a7336-2eb3642fe66mr137002075ad.24.1793795695582;
        Wed, 04 Nov 2026 04:34:55 -0800 (PST)
Received: from [10.92.198.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fe1e6asm7038525ad.22.2026.11.04.04.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 04:34:54 -0800 (PST)
Message-ID: <0face2f0-deaa-4a3b-9e81-de68f206d2d0@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 18:04:48 +0530
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
Subject: Re: [PATCH v4 02/12] hwmon: Add Qualcomm PMIC BCL driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-2-50b9a8c730b7@oss.qualcomm.com>
 <3a5ff85c-0629-493e-baa7-543958764219@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <3a5ff85c-0629-493e-baa7-543958764219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O6SsLx9W c=1 sm=1 tr=0 ts=6aeb2670 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ex46fzmS382XuAsv_c4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: gyX3tm4kGDSV2PahazGp3mfI301w-G24
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1MCBTYWx0ZWRfXyWHEbHeL8po5
 XKYZWg7yIysS5+l7upjHuirDJhnoxP6Cg21eN69wge/ydzpHWdNOZszJs83wAcYCG/J974dlC7p
 f/tde8b2SdFDuI5Mxlq0GC+/ukifoT4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1MCBTYWx0ZWRfX1RqHLqAECIEC
 M4rVZG8BnGNyaf2pB+pjCORZ1FBXhGl+vBCHuAPe0nkzKPqd5/xOOt46oA9WDglfLkDyPBkrXMd
 IIOD79jYK03+cJw/TNxDUwediBOn1qa6otzN8eA8y/eeReQjlJtHKtiZa5S0YiDM1KLPqPA9iKk
 CDzdFJpFfzNrxSDShqCFf+HBPjD92Y83DF/Bc/pnOUjFwNgSXW3oT6TEMtR5mu8F2Us5Tdtl8TW
 hTGGJd/GJJKzLWYYmtHg6n4JFL2PL/b5CD/8c0nX7RUD/g9udbbWykElLHhu+dP/0VKZ1conaGP
 u2RTMLOikOxL21XJecUbK1zgAG6HYAkedMVpswvBxuNEjtZc/R7Ztq8bBpuWQ1gRb8QHGw5F8jd
 5wJYmaf4bBRgb/ctlLcCbDcUGS5n3QjhQ57h4Gocel2e02nIWsD37PMNo8JF7Jqm6Dp6VYhqeJS
 J0mYzB3fH3Xcw97x5hg==
X-Proofpoint-GUID: gyX3tm4kGDSV2PahazGp3mfI301w-G24
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040050

Hi Konrad,

On 10/12/2026 5:01 PM, Konrad Dybcio wrote:
> On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
>> Add driver for Qualcomm SPMI PMIC Battery Current Limiting (BCL)
>> hardware monitor. The driver exposes battery voltage and current
>> monitoring through hwmon interface.
>>
>> The BCL driver provides
>> - Real-time voltage and current readings
>> - Configurable threshold-based alarms
>> - Interrupt-driven notifications when thresholds are exceeded
>> - Automatic threshold management with polling-based recovery
>> - Hardware-specific scaling factors and threshold representations
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +struct bcl_alarm_data {
>> +	int			irq;
>> +	bool			irq_enabled;
>> +	bool			irq_wake_enabled;
>> +	bool			shutting_down;
>> +	enum bcl_limit_alarm	type;
>> +	void			*device;
> 
> Why is this a voidptr?

There is circular dependency for struct bcl_alarm_data and struct 
bcl_device. To avoid forward declaration, used voidptr here

Thanks,
Manaf

> 
> Konrad

