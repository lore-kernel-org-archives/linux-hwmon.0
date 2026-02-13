Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4283590AE
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 11:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770983781; cv=none; b=ULW1wcnc/NI6UPrPVpUx77fsmwZlrHujuS99AcuvZDZ5oLZAla+jBeDCJABFTkU2y/u4q46SlyJ4yK/YPAE9W3nUQaP2nYVbEF4cctHeN7uuF3TfS+vb22rK+8cLXpAyaIY+mSBsX5RFvAZf1dWML4F2XoKO3FwF+jlmYEMvDR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770983781; c=relaxed/simple;
	bh=Qf09cyzNftZFPMVLBU+uctujGDODkYY0pIFa+fPXXhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=omMVjH52xowO1iI7UGMkovvFDXc6jFpZJ5j8jO63dqI7a5E145o29ZZvDXaMrSEMVZ6ZqExjaQK2n0V3s6Nz66gIZmoiTyURxfKdDjRsP1l4oZ+wVU13veDUlMwTeD5cHx8fzWhmai/AiK+bw67CAaQApme8p8q+E3efK2u0164=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J1ctEyYB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H6VtfIqH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J1ctEyYB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H6VtfIqH"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D7Fbuw652673
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 11:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yl1lkFZl9wuYREqqBtZV8Q7h+eZLlSgHrU4R6n9gPjY=; b=J1ctEyYBueCOjTEy
	2saiddyi85RMIVQcgKCkGKHNYRqTSs0ltthu9/c8C09gndfk5WhAUdUt6azrR5D1
	EYy4q1Fi93wa1o0D/HX0Vm4w6Vkzp8+lsjLwVIcp283FJYndztijp1ewdmjsdG8Z
	yKn0AqLcTP74q6/KGggZdYUKbLAEt6fssKIQEmlkYhIkgQWaYKvY/j8eq47pVbuw
	JsG/6naCSH81VBelzZTzTNPtV6dz3bBdJQ0919q1Zax7YunFEl72SjxJtwcUhgPC
	I0Yt9gmObMv9PYret9XRK5AL1R23mKGB+Y/d7SfOxUTr77LEUIfy/Ahz1p4mP4BA
	8eY73w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9gbbm93e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 11:56:18 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354bee18a62so773724a91.0
        for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 03:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770983777; x=1771588577; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yl1lkFZl9wuYREqqBtZV8Q7h+eZLlSgHrU4R6n9gPjY=;
        b=H6VtfIqHp/MOZ0dHiTTUKMWsJd4JX1J9f4Eo2YdphGamo3w8r7bGjZsYpHpXnDNsNH
         beH+YlLKsJMrpjKvVgdl+SrHeeeaiN0CkHBzHlwGQMl62FV9fsmbGZ6xxWhPw0MV/4IP
         dVjszx2og7UDvlYrtowjzGiN8vWrSZdgFTXsDZpkhn+nEC/W9iS8QEh6l3IPGPUeecVC
         UfnQK6MxQPvdrOviv3ZW0Z4SNk/n46zQWWZR+OBBQo+9lW9WOTR1GV63CF7VsoDE5JXK
         hdM6GE9TNtgvvkh2fmEhbNkvUXfE8WjSdZbsxMmGYeOEvEFSq2L3sk6/CavF/lbdcXRG
         GHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770983777; x=1771588577;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yl1lkFZl9wuYREqqBtZV8Q7h+eZLlSgHrU4R6n9gPjY=;
        b=Qr6XlCm12dNjgJ0Ykb18jKkGQ/7iocGGYHpNmm30QH7Z9m909EnSqCJuHZd3rXbU8C
         KrfyQS3dACEYUxT9y71DAps2zJUgv7jaKb1k8KxGxmlq+3Yjair9pba19YriTNMCyPko
         yEgf8MfuFcolgB/kZ21X+p3wGMOfTsbkrZZ1T7FprtGXDv9u/GhoD67BY5TfUs9T4SRY
         aPyiRFMYRWv9emYAsnjNjAFPD1QHURLldH+0wu471av7GRHNb+2gH2y0fgBvf+jFLT0D
         8Jjq5RWZvfcxkgxuofviZar+0k03Kzx/Flj7aMOS1kDw5TQJmx2QzX1OXjE2Ijz9wSgy
         wj5Q==
X-Gm-Message-State: AOJu0Yx/3sv5YkEkBIIKxJe59W3OTdugfKR2djQnv+9C7XzN6wsBiiuQ
	sepa+d2tz7+ryGlkDtp4Xq7yJ6syx/PA7TuRkQK1FVLNdxOShN+aA9wvC8IMcKlO6KKkL8a9PdI
	nUZFYfrUQ9+tMwdYV5H/OK9iSTuM1EYygscqIMElwSsbtF0zSKvuJjMYuQ2CSP4NWAQ==
X-Gm-Gg: AZuq6aJY6f2wIt8bMBGCV6h8I4jZSJEjQqO4MiTZRsmazKmrbInvc5lAI01OYvT3Opw
	Kj01kLhP5aRQ1EwIMjXCSDtv95r9o2JkprgqwWXlU6awp1cjF2n/QzJIAlLhrUndTuSzE1XrUml
	fDKpM2ToBxsUHfpkX4/zKT1FduvIE9P+klm7Xp21xOxmvzQGQC3wYgMUrVruugJjLQhAu2Lonsd
	KAzYDGziD3tEC+JnrgJQht03ZJ685wuQivjK7JOGuVhXH+vL7R7WZhEI+OpTQX5yB5V7PnZ3Eqq
	8AsUFR1Q7TQoxAEeYRh/FegD4butjwuTj6RVyKQfcRSZSBiT07gKoZNLGhqQW2+7QcqAy9T8S/L
	1RXLV04twi3cNeb/q5xGXHAo+FtItypH9ueIgQQ5SvMn78Kyeubw0+YH18A==
X-Received: by 2002:a17:90b:2c8d:b0:356:2fc5:30d9 with SMTP id 98e67ed59e1d1-356aabe522cmr1338183a91.10.1770983777063;
        Fri, 13 Feb 2026 03:56:17 -0800 (PST)
X-Received: by 2002:a17:90b:2c8d:b0:356:2fc5:30d9 with SMTP id 98e67ed59e1d1-356aabe522cmr1338151a91.10.1770983776462;
        Fri, 13 Feb 2026 03:56:16 -0800 (PST)
Received: from [10.217.198.130] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3567e9dff38sm7864552a91.7.2026.02.13.03.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 03:56:16 -0800 (PST)
Message-ID: <eb559791-b8b5-4836-ade0-db927b9fe830@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 17:26:11 +0530
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: pm7250b: Enable Qualcomm BCL device
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-3-7b426f0b77a1@oss.qualcomm.com>
 <c1a9aec2-0389-4a24-bc28-75be04cc91d8@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <c1a9aec2-0389-4a24-bc28-75be04cc91d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA5MiBTYWx0ZWRfX6dmhw0H1/F3D
 KuCPqTRDpG6iIlwbosCeRij9xExwdOp+x8jEMEE1n7sEWohuJ0lnXqCWH8xjvjfm40ufkCif1US
 /fkFltAuHiDD8jH170OtOZd4707UC77Mv6IhXM5PNIOimHd+cVG6ruKxiI4xc/ePaNu8hC8jqdh
 /4rWise++lv+hbaXoZ3B/PF6YkXnOqyKR/pIdMszo/bWz4zOxyyANDm+JVpLO0tr1WYKx5g8GUd
 PFKk/uFAWYFlTC4Bw0JzlOJimJfPxubLwNpkpEpyfk/6B7owGtfUzf6dV6/3idHkldOfMCEWqbA
 fj9XFIgDFFCDRgvbGCmGhTufxvYUhldGsFcG5bpiN8Bg4ZBBfPoVoT30Wd/Su49LW0ufWJrdOx5
 smYL1xqeffpOkwHz69o4QPD1FjtqfrVrkfInzkVVPjCdmmBSH7ilgPZ9B3tG7vXCi2f5PC5VE/8
 rwXpRcise9IDVkJGwfw==
X-Authority-Analysis: v=2.4 cv=a849NESF c=1 sm=1 tr=0 ts=698f1162 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=VnUY3c1hKrMq6ITwzwAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: SunMKAO5Glg31f4LObOwzGTb4ZbGsk45
X-Proofpoint-ORIG-GUID: SunMKAO5Glg31f4LObOwzGTb4ZbGsk45
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_02,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602130092

Hi Konrad,


On 2/6/2026 2:41 PM, Konrad Dybcio wrote:
> On 2/5/26 10:14 PM, Manaf Meethalavalappu Pallikunhi wrote:
>> Enable Qualcomm BCL hardware devicetree binding configuration
>> for pm7250b.
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/pm7250b.dtsi | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
>> index 0761e6b5fd8d..69ad76831cde 100644
>> --- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
>> @@ -202,6 +202,16 @@ pm7250b_gpios: gpio@c000 {
>>   			interrupt-controller;
>>   			#interrupt-cells = <2>;
>>   		};
>> +
>> +		bcl@1d00 {
> This should be higher up (the node above is 0xc000, this one is 0x1d00)
Ack
>
> Konrad
