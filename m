Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796029;
	b=UyYGk31GbN4JJTN8YEAkTUiC5E3ZGd6DUQ+cRUK2lK/8WmV74oZYlW8IWiSnIc0vOAWV
	 m3Z5+zUBdCwwj4//MOHluIeS+mEo0udP9Wau1nGJnJxttOSC5yVYx08z1Sj6xsqnL1/YO
	 6OBY0gYeT6PdBkbERN7FE9dsk9KAvAx2IbtaL8KY+ZXu50M5L4d1q1P5vklKJP4my8WLg
	 6Hxk4HUNNKn9WcFFmA47nAqUnqk8whxcVxjjKEJmnWsYvUBoJ8+TgmeMAK7Taivuv6xOL
	 dN1gACYsYV/W2N5/Q1tbk+VnAJvRlgrcGA2rMbyy47R8gPkbvX0sPnYibb63yfSZFLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796029;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3JK3zLqAxgD4t3oDKY8+G+aUNHzEUIyP3YZKLoNRsEg=;
	b=r+dDsz2P22NugsMxT2UoA2stB9NjnsbdjdHGWtSPjIcHOTaK24lYaoRNQ/k7AAH5VjJe
	 fJhOP2IrnzLCe9jMx4xkDQH0s9QqxuncF5thVppx5mD2JJGfyWzZSckpeHy1BLKMGmI2p
	 3UrFicB72ONnA6jxI4YANmIaGGtJ0udczqkEqGF1jn3cG+uYmEPLKuChIpDZwcCbzj+1P
	 3r5qsDQXUhRc601ughCr7ucBC96FtxAldvVGApvoY6Bu81SbJ4rTlETz5gQZ/DnQ6FE2q
	 r0GI2AxUCxk+2f+RXYD08tG052UXeKjQmzgmXMslsIUDJA6DTNb6GD6sJZL5XQQpjAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iwNMbCnV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HqCcLWzP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E897606A328
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Nov 2026 12:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E897606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iwNMbCnV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HqCcLWzP
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZpib739139
	for <linux-hwmon@vger.kernel.org>; Wed, 4 Nov 2026 12:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3JK3zLqAxgD4t3oDKY8+G+aUNHzEUIyP3YZKLoNRsEg=; b=iwNMbCnVEl0qopmM
	z26LlSp/6onxPzfFrIGHpglgjNeNDGufF9VXPf93ENI+VyvjD9pF29uTSDT1XaiO
	lz2rCK2D8eIjdEZ8do4oxZyV/YxdxJKcPGsfAXU9cUsmkxKQVPatRYat/4steeZd
	FCPo0mFOC2nvDHg+nD9FvIoN6VdK+7qgaVIRWu60CH62c38fg9CLLhR5jexEGg2k
	SenFpC1jxWAd4oCysGV+rNVRxv/qKg0CTHLLIpIV76buG4Lu2OJaUpBHcpigcrA9
	Zf83vafsU4zKsKCUnyITXUGrWlCBXYXL2nwoK9mN9UQP1kgzn361F4zIYNY6FKFv
	AhMwKw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr163h0vu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 04 Nov 2026 12:40:27 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-706eded47cfso724638eaf.0
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Nov 2026 04:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793796026; x=1794400826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3JK3zLqAxgD4t3oDKY8+G+aUNHzEUIyP3YZKLoNRsEg=;
        b=HqCcLWzPcOh3EzSlHDcXplinyJKG0GBnwxFKSXylRXXdtpQgDCaUudXgGAZCa5p+jV
         AfvJchX7XlgXyYmccpvT960jDMvmPnaf5oLm7M5X1v5Jwc9mvIUBnJ1Y6/acKcMQBPix
         JOfnMVeNXMggSKTSgzmC7HSPW+kfdEh2T91yThzsqY7f1j/uz7VYkK+qVzbO2bdr1Yxs
         HQncNpi4OYEqP8S6Mu7gANXGmtBSiLBaIXALBtm6UiBi2coYQpudD5QHw8NoSk7lhoCm
         GVwiiDvE9C9FvxrLftvnm82wOymt2G7k3vjYbLqGOfUhtLKFA3Yr83LJNEIwdzfJKvgy
         xgXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796026; x=1794400826;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3JK3zLqAxgD4t3oDKY8+G+aUNHzEUIyP3YZKLoNRsEg=;
        b=FrnRv8GRI7VVqJBeCqrppYay4ru7PWTdT9MRqy5Rq/rKpuF60Oalep8b6ouexPbnhE
         GDPznnF63RWf5Haq51C8OYKA01VA8ALJmVaYFUhkwfLTkPTqkgFe5Ncqkia/8OaRf9Y3
         Y195no58rIUTASncjAMGmjRXHAsAOeke/ZEWaRatlMlEzwqKtavJ17VrQKZ0Zi2/V2jW
         bi3l84yr8ZEWPv7N11dkZY1N+qqfNlN/w2tIARyNrKxcXn9v7WRmEV+Hyus9yap5EFjE
         2snQyeAI5i4PNRAsWK6ShgnwN+D5j/Y640Zo9iFpf/44a8HigBF+GlpLUUIKXGjWfSg7
         dRDQ==
X-Gm-Message-State: APuU4Z+xqMgIrCTtMzK9P7OD1RPG2gp0MOd/MNNhm3pCvtlGMXDyll51
	EYBBUBB/XK5CH13Vy+BBJusKA5UqCi6LK1CpCFOm75BwiSDerHLC4cVFpsvIQCLLTXzGRovr+Km
	3s7KX8da6NeITCEQ+rG7j0ryFbuq00Mjhol0/VH0xJHwjMpFqUisu07T6FdsdDFh6TA==
X-Gm-Gg: AYBFou3ba5hKDykD3XrPiRFDlwju1NmZtIXk4cxKV9FwORtBYElIa3hslO5vf4jmIpY
	EB//kSKwplo8CFykEC2CAaUQhfC0A/TSWd2+JT1Vhrc2YfcSSfwhnXb0eOn0hZL+mkcZIx6tymp
	EZESH4lQgwtPVuePQYK7+MgQjrj7C3ijtzt61B2wZqlDG/wHCUfVEm2GkkJy/7kcGb69xpIukcT
	pV3pz4K/Z/BQNqx5NXDztW/+ZqBuiFPcUKUeZ8ilegA5n4U45Non2LVLzSs5F/H1kIjGZQAasPP
	8K86hOHNJOItwsKnupsTndZkXALqdW2T9M3Lk983FrlvKUZXD8hrCIEsPccT4mg4ntdyALG32m4
	q/mJsjShOk+vzGmd2PfeAmJDpowG+YsjMwGxjP3cA+GZtjNyGl6Bh8jOUaUXRYJiKkBuXG/C5Op
	wzADQnJw==
X-Received: by 2002:a05:6820:55c9:10b0:708:ec28:6fd1 with SMTP id 006d021491bc7-714f256cde8mr6042786eaf.66.1793796026389;
        Wed, 04 Nov 2026 04:40:26 -0800 (PST)
X-Received: by 2002:a05:6820:55c9:10b0:708:ec28:6fd1 with SMTP id 006d021491bc7-714f256cde8mr6042773eaf.66.1793796025883;
        Wed, 04 Nov 2026 04:40:25 -0800 (PST)
Received: from [10.92.198.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716c12d1f36sm1517007eaf.8.2026.11.04.04.40.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 04:40:24 -0800 (PST)
Message-ID: <3463f5b6-e498-4d06-89e7-8b0fb873f3da@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 18:10:15 +0530
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
Subject: Re: [PATCH v4 03/12] arm64: dts: qcom: hamoa-pmic: Enable BCL sensor
 node
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
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-3-50b9a8c730b7@oss.qualcomm.com>
 <43a57f69-caa2-4943-90a5-729e0f378b21@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <43a57f69-caa2-4943-90a5-729e0f378b21@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EQ0Ghs31i8I8d1kpHffJaNxcJnRNBm51
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1MCBTYWx0ZWRfXzUeI7f2gTiOV
 4qB0MQGQ2tHIK5wf6CmO9Dq3tqrg+YySqctgszGifD0mCdGJdBJXx3RZcFbHEWFbNrdYAOE3Fz/
 dlvq2TmzzQj/dIg1jBoQlMafPf3BAao=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1MCBTYWx0ZWRfXzuR8LDrIMlY9
 D3CF1waRGlREavt5wdn0Q/Drm1Z895J+2gulU217IPZoMmJHmlQFkumnZ6naoqfwopl81ECS3Zp
 BvRggTY5oLQuZkuOdklJn953kB9oEvYQH+xgjnPpqRsORde4yImk5lZvx16/zy/WrmIeYf8DA5N
 nr71gl1ackVqUalHCYRdTj0Dt2++ZcCFfMigvTYW1GDhbnCaAvQVCS/d0gk/2ISSWr/VyRMa5OF
 vwuY1C1YquN2BDVOR11RR9vKvfqZbuwVsauWhjsxq357YG6nYl4jzwK7LDuOACflUJyMXrWci4J
 DXskWKS67edHsmR+M5+IJG+5mxh1c1HF3fBPeNFBw2laYuWJRk6odxZBYjSpSf4rxMpBO41yolv
 a6TWlwGmmANM2o3PcJBgiAWRWFk4R3kQAYSEFfVM/waa03AjcGDqu0lMB16iGseC4K8MREOhOPc
 BQD0hw0EpAcJGISz40w==
X-Proofpoint-GUID: EQ0Ghs31i8I8d1kpHffJaNxcJnRNBm51
X-Authority-Analysis: v=2.4 cv=O5OsLx9W c=1 sm=1 tr=0 ts=6aeb27bb cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=IhMxsDTVYy43m0kJnUIA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040050

Hi Konrad,

On 10/19/2026 8:21 PM, Konrad Dybcio wrote:
> On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
>> Add Battery Current Limiting (BCL) hardware monitor node for
>> hamoa-pmic. The BCL monitors battery voltage and current, providing
>> hardware interrupts when configurable thresholds are violated.
>>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> @@ -674,6 +685,17 @@ smb2360_0: pmic@7 {
>>   
>>   		status = "disabled";
>>   
>> +		sensor@4700 {
> 
> Is it not there on the 4 other SMB2360s?

No. The BCL peripheral is enabled only on the first SMB2360. AFAIK, the 
other four are used only for USB functionality.

Thanks,
Manaf

> 
> Konrad
> 
>> +			compatible = "qcom,smb2360-bcl";
>> +			reg = <0x4700>;
>> +			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
>> +				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
>> +				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
>> +			interrupt-names = "max-min",
>> +					  "critical",
>> +					  "emergency";
>> +		};
>> +
>>   		smb2360_0_eusb2_repeater: phy@fd00 {
>>   			compatible = "qcom,smb2360-eusb2-repeater";
>>   			reg = <0xfd00>;
>>

