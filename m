Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD8A274652
	for <linux-hwmon@vger.kernel.org>; Thu,  2 Jul 2026 13:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782999328; cv=none; b=ax+VV3LEwgjrHoHYnpCHU1+vOnGhncKArpYQDgGP2LE5vRuicfiUpAr1pgzkGd5u/0uF+G8scR8G3aYxiQ+7y/Tf7Qt/tw4ianSUjHhgZ7nGlaL+9bPYhMgsnjq3jkPsk/90jf5tUBX88SEnSVL2CBy3v3VXkaujBkn7g3LacX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782999328; c=relaxed/simple;
	bh=E1/9DIDIMVTroh6AZSTdy0KhiA6AI5YzqTm9giWRgZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rL2+6kuUfv3b+rgZhnuXSe14je0zkOG8L/us4FC6mW0oZJUZGPs2f8bLB6sqoI1WmsQ1dS96u9VHgYmWTKrsxKVIhvK5wak4J3qh8efHue8Z2NlqOFl+2bGCJ8NPu8WBPLS+D1Xl/P2SO+zR8gOvEMuwHwmIDAn1QW1K4b6kwFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X4VR7ffB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EMsWFrj3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X4VR7ffB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EMsWFrj3"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662D0Wgg518207
	for <linux-hwmon@vger.kernel.org>; Thu, 2 Jul 2026 13:35:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iP2L90DYVRpyRK2MWL9L9i4kUeULtc7huFI/8WNOEOU=; b=X4VR7ffBpKxKPjAV
	GAgRko8DSXI4y62ewp/0IhUfj/Yvv6lsC8NLfTDi8rf7PAqyoUnqgtL8IpQpbGF5
	heHLgxa7V37vo+/RfGsoF+choyY4DWvUK3evZ+KSO3pLOvyziTpRiMAuvcLzA7/x
	X02PzURiKbChtswGdXkxMJnmOx0qE0rY5AVxklDJQmVdFGbrEmdPw4U11URLWkB0
	+gk5utfZanMaK9xEcxoyPJYbAF0HbV44bbL6v9ViZrJ9FJTOC+WbR7nQ1o8SVbSl
	tMqreavqMJq55igFmCbwuAvkYfEY6oMo0ifFAyRyXCP1LKtniX7nM/Uc0vOAE63/
	BdY1XQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qfc0dqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Thu, 02 Jul 2026 13:35:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-91ed0e140c5so383969185a.0
        for <linux-hwmon@vger.kernel.org>; Thu, 02 Jul 2026 06:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782999324; x=1783604124; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iP2L90DYVRpyRK2MWL9L9i4kUeULtc7huFI/8WNOEOU=;
        b=EMsWFrj3i0JcZ0hs3z+3/zxo0co42g5COc1dGKSdR7YGuJicZ7iWEb6v1nwJBDAibI
         P+W+HLEEsxoBDUSx6Wmw6zOGJdcLzhYEgH+HFLUJyvH+amR10hF7Y13awXk8a8+y8Y2Q
         venSReUDCG04u5f9q+Cxek+9Uh6ckt13Kt+cjByYjCcO9LEW1xb8g5l3SGHRR07IqgQV
         xHKO/5myr5d3zN6QEb3nBNsbIqIJbGqV7G+CrGlDnyqGJkof2e+x1rLHMy+CdpWZNs0V
         9rrqWRdXBxTthwrKz/D4Bao1z99x4RLZpc+Rib8DuYs0lUaRbCspRKI+39hKgUj9NR5K
         p9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782999324; x=1783604124;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iP2L90DYVRpyRK2MWL9L9i4kUeULtc7huFI/8WNOEOU=;
        b=q47c3vv0iBfoXq4EOEQoZYNnfY9JIwjYkRbzqNLH9+cnWBOrtYsKXtjzidTCZc3QNm
         4BZiaGpNND44BwDIUe3oqm5gchHe413DsPiNAkQxxpc1sLP2PkPUTkWjkpwB1fyVnf+f
         nR8xndhoPr+PvJWkrqHOTLkDRRQk4TLq6rytY/gIkYT8aZLzNnfrwBMjP8IN0793Oxop
         yLiZOet/HCslKIqs8P0q1bKXOLjR+D88iRgXB5ZCce5307mg57AjtzPUsOwme5AIOPNO
         Z3K/FK7voSPWJ9/ya7y5TKk9i43Jr1Zl6WkCLPF4WcQoC065mtr4whQ8OE7szndeJl08
         fG9A==
X-Forwarded-Encrypted: i=1; AFNElJ95S7umgwkNVbdWi4zeqFJ8DSne0LSIb75FwoBYGhcuGCqh2EQ/Vr5cUjRV86JiiUqyxxZrdfLmQNs5iw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzObM2vbRrauAbFOHHqlT6S54scDlaJRGYoHis1YU/hwMZhWc6j
	+7GmR7DTLtTJHkbBet/T88661kUGnHGfMDK5MAbtjDNVIduzHynzs06tQPv8CTO4tOVVGKKx+dn
	OxXlox5Z081qVMveZl3JbF/v1dyUF2R619YrKwIjmtzkuR7sKLsfGEdeoODtoD/z/VQ==
X-Gm-Gg: AfdE7cmuQs2Wf0Vpiu6e7Quc0pmeQXpd5Ucgvlu6ZoPC3ViPPG+Ud0EVoGAI7kQqCWB
	qA49ewTj+xhCrgqWaKgAUMkkO+/0nD+IRs7Jtrf1V6Rl3Jj2LBXafXoJogYHExYtg+gnvN4vb8s
	oIVzrGJrjygrJfFDmHxn/kBAlii/rzfjE9BbFd9kZixPC85NU1iWDRCcUCx6o2t7EkFMb2Xc2VA
	ZmEPhEYUMbROo/gbqoMn/OIkdE+bsAd+pXTf1rcb5TGIPSn8BrGJeWvLLiPXEWeXowLLVjrJLe5
	lHHGOrLikjsElAzRg4JUO44g2Gd2yB3mdf5gsrIeTfmne27DXhao7xdHjcT1v37wBcR8vo3ExBf
	kCL4Yp6snjkNkyDJFsIef387Jy83bMJI9q/3Bz3m5ODorJSzeHjJaefzQ+VCQGkijyQ11neiztw
	==
X-Received: by 2002:a05:620a:2a12:b0:91c:d0b6:13f5 with SMTP id af79cd13be357-92e782408a0mr785674885a.19.1782999323791;
        Thu, 02 Jul 2026 06:35:23 -0700 (PDT)
X-Received: by 2002:a05:620a:2a12:b0:91c:d0b6:13f5 with SMTP id af79cd13be357-92e782408a0mr785670185a.19.1782999323377;
        Thu, 02 Jul 2026 06:35:23 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c635c41dsm95373005e9.5.2026.07.02.06.35.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 06:35:22 -0700 (PDT)
Message-ID: <2b51d68d-9f13-4b21-a0cd-32b78ceb5755@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 15:35:21 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: x1e78100-t14s: Add thermal zones
 for keyboard skin and charging sensors
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, sre@kernel.org,
        hansg@kernel.org, ilpo.jarvinen@linux.intel.com, linux@roeck-us.net,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260701103714.22583-1-daniel.lezcano@oss.qualcomm.com>
 <20260701103714.22583-3-daniel.lezcano@oss.qualcomm.com>
 <6bcfcd62-d831-4262-9ce9-66e12a72b3f2@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <6bcfcd62-d831-4262-9ce9-66e12a72b3f2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XxU7jAMOYf5Nbirf0e-3syJQ8uXEraZ9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE0MiBTYWx0ZWRfX/d1i1h8B8wCN
 N8zDawrxhq9Bk42WkpFY9LwMLMtF97CLKRCUaWWRD2ll5pkrF2SvL47cKPknDliNSf47xy5mUcN
 5J6+MZ7szOcPE/C3UdxcFD7ahhnF4WRMlHNrjB3wJzk+Gwhop/CL4vqkt7HyoAZrW/AnWZHGx/v
 NlFuuu2IFhyndl7ujmEDqe+aDZVIS9TjTa3m02ZpXxxRG5PsMBToSThCnqwWnlPzEA4caCQDaqZ
 6cv7RNkS/VUCi47DN90mnDPjFe4Q1Jea4wd3Hlnr0BKMPz5IhK+3bCUnBXM/lrVC5HVp2Pfg2hD
 SddXFBclMHHUis6H/hKttakdxLoppgfr4WTFM3ZmHoitRaApVbypo8LkJY2y7JteClI/fcWK/s0
 NCYNB1bU3OJ4RARLu+ENF3EaT3MpQQuzmS21A4JSSzBtMbSzZDs0F+zeznhGHjLizFABe5pDRLP
 NFAW8qQm5Oyxnn9dLDA==
X-Authority-Analysis: v=2.4 cv=dvXrzVg4 c=1 sm=1 tr=0 ts=6a46691c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=3fF9mxJG-zv1VSP5w2IA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: XxU7jAMOYf5Nbirf0e-3syJQ8uXEraZ9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE0MiBTYWx0ZWRfX0oEjnhJeluxb
 Yzh89HMYXnq2w7bMN2vnQ1MHNotAuSyUo46xmSkNdWUKeZfZ7bwXqCJkoV9gROlIvnEFACdCg/C
 aON1Yl29qs01rNiwiYWO8lan/i0Zmnk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020142

On 7/2/26 14:17, Konrad Dybcio wrote:
> On 7/1/26 12:37 PM, Daniel Lezcano wrote:
>> The Lenovo ThinkPad T14s embedded controller exposes several platform
>> temperature sensors that are already used by the firmware for thermal
>> management.
>>
>> Expose the EC as a thermal sensor provider and describe the keyboard
>> skin and charging circuitry sensors as thermal zones in the device
>> tree.
> 
> [...]
> 
>> +&thermal_zones {
>> +	ec-keyboard-thermal {
>> +		polling-delay = <5000>;
>> +		polling-delay-passive = <1000>;
>> +
>> +		thermal-sensors = <&ec 1>;
> 
> Do you think it'd be worth to add dt-bindings defines to avoid raw
> numbers here?

No it is not worth. Usually we put raw numbers and they are untouched.

> [...]
> 
>> +		cooling-maps {
>> +			map0 {
>> +				trip = <&ec_charging_psv0>;
>> +				cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +			};
>> +		};
>> +
>> +	};
> 
> Stray \n above
> 
> Otherwise:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks for your review
