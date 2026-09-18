Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8138A3A6B77
	for <linux-hwmon@vger.kernel.org>; Fri, 18 Sep 2026 13:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737841; cv=none; b=bjRdGJjMKJtSXW0NEElLNsrdqQ36GHML0NbfP6eH7Tc7wxHVcWAcXWyR353kwOqtdKHiIpvQTWWyCgd455V75Gkqs/WZVlvo8zcEap+UON4AMH1jod5oVpeuzygQVIPPk4EXQP99pXjG5B6kF6bm89c5dw0DtDteVguFieulLaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737841; c=relaxed/simple;
	bh=Yc7wqbvlmYIYSmY8DLM/Fc/IZHx3O+w9ugmnjA+pCAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sJdYotCQp/0VpUDQMgohldv5JJmOZ3nxi8IbOQjC2gcGHhAnsu0z/TjDDqr2CLolnGuJ4opKPX4pS4QiBTh++0NyYGaUuthuyqlZ9NAFIxTSG+Qrc3b4imlT14o6XtqudJ4VsSb5rPyCoNrFKZYxtgQmJP7K8pe5/XkVaMDW5P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hf/BNKxC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HNo3hFAP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hf/BNKxC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HNo3hFAP"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ICuGnW4177481
	for <linux-hwmon@vger.kernel.org>; Fri, 18 Sep 2026 13:24:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fy6190x1sYwn8rEIWDVlCsQILwc5wbf05atZKqyy8Kk=; b=hf/BNKxCTppZPbn6
	Xo+8ydQNhF/FEBjcg4U4vNdLZTC4jDnxv2z8zvF02U485r9hNPPBijP75Wx/2JgK
	64X1sLLRRsNoSux8BdzkrCATqOUPhpTGVLYgpZw7k1qMt6dY/mfqknYpIkdBIRIF
	8r4wTWA2zwj30NWuuQd/8kFmv9wVs56Ro3Ysp0mLZWYx2cjYehPvDdbeHl7by9GV
	T/voniU4jYQrIeOW2LySKAEyxqJP0OreTpGgN8XM8hfsdztDPiJg1oSR2BFKO7jy
	0b30NJsbh3g/4M6slkJ8SVD8+T7H4TSbXtgIH6Fkt7P8Cy3uMMHGyi4Ic04AaSMW
	dtPCBw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grmv5mb31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Fri, 18 Sep 2026 13:23:59 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c65b0280a2so21254e0c.2
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Sep 2026 06:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789737839; x=1790342639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fy6190x1sYwn8rEIWDVlCsQILwc5wbf05atZKqyy8Kk=;
        b=HNo3hFAPdhJnm+BC74IvseHMgQ2m3e93jOwHyr0BUPd/fVf4xJwzKqH/mrhnrndg5a
         lFz1urMCi+2Wsyz5vS2Au+PxZ9Tc8/Q/kluYgZfJ7gABfrlyF5Hr341TCu4vE7Z/ZVA4
         mBDSFpisfBoUDfDntAlwMSFzyl2L+wqcBOadIE2w6F6EY6EcBhYNNlAPpgjTRi/7Rvza
         NLeO4gwACDdOxWwhl02bEmrDzjTogM7t9zv+FSUMOj8lpVhAuoNglkKNGMVanxsYP4PI
         HYdLt7+hb38pCpd2rNlk77KiWPA/Y2LKWEn6aXo7dYXJZrgnW/72qEzfCC5y86SGQB5i
         ljUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737839; x=1790342639;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fy6190x1sYwn8rEIWDVlCsQILwc5wbf05atZKqyy8Kk=;
        b=LC9lp5fDjUnUu9lzUbIyBBDK119+bmfm4FCapGUZKS82mSs0oFGipBKePQBH4ZXthF
         Novkdm9UTSi9hFQJm7K+cEF9FcHF1+vUI5dk0BLqFxJQm0AszrAeUpj2oFmklMwWfCFt
         PKYuVrG/jlrZ2yCHOqBUlERCcmp6GSCeScjAObdcd8YZFHT7qyob/9O2r4K27Hrb+7rv
         AsMeUPtcfC0hUUpZ6wgz81Cagw8Ej9+lgvejp+i5SfJ7d3CvOcjK/SOQ727JOpRt3rNs
         1ZlTLT2JGDpEw1M2FUURZGtmYMMqAYR7sivkmhkoe3fvDTeRLdzJILXSQLgPJ9bpi9iY
         Ajww==
X-Forwarded-Encrypted: i=1; AKwUvBwYp79HoUfAtve1IOuBCe8mbJIQr/7hrL0hH7tFmZ6qa2rvKuhOfZlRz0dV9GvmhnfcmGwtw4VgXSHyVw==@vger.kernel.org
X-Gm-Message-State: AFuF++lmB1SAcdaaZupXgYEbapubCWEpZhwOg2wjoI34OExCh/2t3z7n
	WQXF3M5prZiNmNwAhkfahgOjvs8+k7qeqBzMTEita/UpdsD7M8Riyvpr2g3x5AuMv5k/datGnRD
	Fdd69RoObs9Moz+Q/tyFFvFC9dI1R3wEV69bM4KIfqc7YCHB7Ty0NKG4ZNdgJtOGz4g==
X-Gm-Gg: AYBFou26vRt5XvfYX4wSMWzEKP3OSazrdwEOLh7B1HZwsefYwpWmaJl/Wiu4SgeGKzS
	udPxECNk5QXsa8MCuKA2l119nIN0HoCuBMvWz7T6lqUIkD6arYUzX/DRzJ73vfXAvSq/80D5a5Q
	lW+GZbsv32SV39gsZSyn+BeqpJwDk8o2sSWB7j4ZW/G4uHmT8dfj8wshsRtuj+EjPnUnCArcuLG
	5aegu1iToW08AYe1JmpxUMDyRaHhmatCeAQFqz/FmyLDbU4HH+ri5knsLaXJcqT8Yir0s9LTCXt
	Hu/mlNSwULyrlQV3uifH44mNIn+VsR/MHfC0xXlnyLud0woojtFrSbJL60yYWgoVWfeXF4Vl2y/
	W3piqcsw=
X-Received: by 2002:a05:6122:1b8e:b0:5c5:90ae:a8b8 with SMTP id 71dfb90a1353d-5c9b588e086mr929308e0c.1.1789737838673;
        Fri, 18 Sep 2026 06:23:58 -0700 (PDT)
X-Received: by 2002:a05:6122:1b8e:b0:5c5:90ae:a8b8 with SMTP id 71dfb90a1353d-5c9b588e086mr929254e0c.1.1789737838198;
        Fri, 18 Sep 2026 06:23:58 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa58f3237bsm856663a12.8.2026.09.18.06.23.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 06:23:57 -0700 (PDT)
Message-ID: <9709e146-0f9a-42a5-bfcf-2e5f8b49df2e@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 15:23:54 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: embedded-controller: Add ASUS Zenbook
 A16 EC
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260917-topic-asus_ec-v1-0-373516d347ae@oss.qualcomm.com>
 <20260917-topic-asus_ec-v1-1-373516d347ae@oss.qualcomm.com>
 <20260918-objective-okapi-from-neptune-cbcabd@quoll>
 <92b7a87a-c086-48d1-8487-883dda7c4d70@oss.qualcomm.com>
 <372e9dc8-ec28-4d8e-a349-15145b82385d@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <372e9dc8-ec28-4d8e-a349-15145b82385d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4OSBTYWx0ZWRfX7RIU4xUZJAgr
 ZXsUzkcv7+5jQfkDvOi26Wn2+ncavslsvcwckVDtRcoLaxrwUJUAcHSnbLqWRjD4vKEHptWusEH
 kZTNc3CnHu2g3TR68S07etbpheurPXsr4GkN4eOq2beEHeflCc2uOO7hjiObA1idEG04Tk2QF5N
 BIqx7+h+dcZ4p8VH1FYnN692gid/deQyC2EwvKibR3+BftXKvXEs6zLNIilCOBixaKqzkoA9AIW
 6T1gYc9VGgIEiD+K+9Se4Esd/NGC6M1xZ1IPNfv8AtnphTKsMoBjW+QrQLdZ0sD8CS4AR/6Z2Em
 Vc7hlztJFoXTdFFGgq7szuVzTOilD2VcW67aBg8h1CNhjZ6UH5B9tyJLGt002O7Pc8SHILcYilv
 efMBbzj4lhWk/AD8tNHjJv+47COih7IRR5EVRf0vKIxJ6wL93KRLbdDgTxItDDZYVUr+B57f/jN
 NKRW1fvAehS5Gjk1Ycg==
X-Authority-Analysis: v=2.4 cv=E+5YNqdl c=1 sm=1 tr=0 ts=6aad3b6f cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=PwanzjBgMYuxxlb2B-IA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: 9ydYXW5THafUtLad48fp_9g8rGUIU_q2
X-Proofpoint-GUID: 9ydYXW5THafUtLad48fp_9g8rGUIU_q2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE4OSBTYWx0ZWRfX9aBkWlb/wXu8
 nLRpsQC90R5bID7b5ttDmjyAxUphsfKrtQ+KcZCnOv+dGD4hJn2xRwpvA05YExHC1a/xaBCEove
 ejklAh+kWJqZaW58g3ALUHDFrltQR5c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180189

On 9/18/26 3:21 PM, Krzysztof Kozlowski wrote:
> On 18/09/2026 14:29, Konrad Dybcio wrote:
>> On 9/18/26 1:34 PM, Krzysztof Kozlowski wrote:
>>> On Thu, Sep 17, 2026 at 12:54:56PM +0200, Konrad Dybcio wrote:
>>>> +description:
>>>> +  The Qualcomm Snapdragon X2 series-based ASUS Zenbook A16 (and similar
>>>> +  machines) come with a custom EC firmware, loosely based on the
>>>> +  Qualcomm reference ("Hamoa CRD EC") implementation, with a lot of
>>>> +  customization.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - asus,zenbook-a14-ux3407na-ec
>>>> +      - asus,zenbook-a16-ux3607oa-ec
>>>> +
>>>> +  reg:
>>>> +    const: 0x76
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>> +
>>>> +  "#thermal-sensor-cells":
>>>> +    const: 1
>>>> +
>>>> +  wakeup-source: true
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - interrupts
>>>> +  - '#thermal-sensor-cells'
>>>> +  - wakeup-source
>>>
>>> Wakeup source should not be required. If it is, then it is completely
>>> implied by compatible and there is no need for DT property, right?
>>
>> I suppose it's not *required* but it's highly desirable.. should I
>> just drop it from the required list?
> 
> Then why isn't the device driver setting wakeup unconditionally?

The i2c core checks for wakeup-source - I can remove the property
and call the equivalent functions from the driver if you prefer,
but that feels a little "rough"

Konrad
