Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796139;
	b=NSevTbUQVVkPudFgPm7md6tu1xQJQebz7sOewPPW7NGbtBK+i2+U4afaPcJ/h0xwI2wV
	 QTNJQg4PoLYJ7wgDloI6xjkOWzzr6X1kfnq+iOHpRf4nJhdzOzb7Y7oqeC6gnT5Xk4JtR
	 9GgP6FZtpZZRLbTg+NMI79YqhoVNtWoujS8BB54CjvZd+PSdtn4CRjqaTfdPENGj5OA94
	 YgMIufGQ7llPJbe+npbIA+cxKIdfyKmNnaWsS4HHSTqA82KJ+oPLMHW0wwMv22IJPSq3n
	 M969LmhIuCBEyUMNjl9h9V1gRLugn971gd5TmfchrObBMqLvtIgItjs8/mjfSnXlqoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796139;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hn0+1ocYLLGWHtUKY+oUvVlgS3nw9sVblusFHim9GqA=;
	b=lnKKuZVPMrXMFycjobhLIgN2avt9GmNYcbkSHmyGoUbv8s9kYNdfHbsIcKGSFAhJE8CV
	 p9YOds0s286P+B0mMzyWQSEMpQ/BpHLqlXcYxiAYxFXL3Fgg9Qu+N/HJs6jr23JYzIkUJ
	 /JNbLava4tU2xU7Dzmmo9ycgN84uGl3mKUM2+2usIU547By0VKXG53nK969mytIkm9WXI
	 FVxDQyIMUZaSPix4qWfU4EC9p+1Xn8WOnYEdZ+IlSFLJ+Sc3rnIXK4S04nG4wff8uoc3y
	 6/K31m8sQoU3NsTN3ZvFNlWovraN/XCWfuSbAOCsoZ+Z/AzttEeXEuLnqBd23OrB4GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UiT1E2wl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fG0FhS9J;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108FB606A326
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Nov 2026 12:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 108FB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UiT1E2wl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fG0FhS9J
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZsvT2284172
	for <linux-hwmon@vger.kernel.org>; Wed, 4 Nov 2026 12:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hn0+1ocYLLGWHtUKY+oUvVlgS3nw9sVblusFHim9GqA=; b=UiT1E2wlC4LPns21
	26JaTaMG0ZJ88knZvaPJ1cjuUkiOUawIQ7KxFarPy69PPOKkCaXNAQlE0u7DIQuS
	UpVXFrJDfRDK5nJBxe7V+mme0U2o+LPtytdGCG+LAH7QTc4zoYX1d7oo0I0D2bl5
	EHt5jm4z9yNyAhMQiXS2NJ3sqcM2etlzI7kbRdUkgS6rJdz6+JFds1f/FtcOCTP8
	He4yS2TmDqblmBUI8hJhQ4PZCWVZitBT8Rv4QTidQwZj39euTYfhwYMazKwhe02E
	DPFkeAGSu7BlGqeJsN5H7bJMI6W7TnILGDT/OteKDH3uGvxZYGgBPIDxEsccreDh
	u5MkAw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr284rpf2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 04 Nov 2026 12:42:16 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-703e6765034so366340eaf.0
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Nov 2026 04:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793796136; x=1794400936; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hn0+1ocYLLGWHtUKY+oUvVlgS3nw9sVblusFHim9GqA=;
        b=fG0FhS9JQn+BozO3evXFHnriArZEZZkC5l7152CZW2R27fK7q5pwkldr5KIXaccyxZ
         ktUvXU1x5GvctESAKnjb+WPO+l5rQEK8psMAsnDUFoAUZDIBA6tbK3Pw3nvW2ChPZO1G
         H5+SQU0EhZ9jZIcwwz+z5pHzfI9M4SzSilzDtoL+4hFPKLge5rwk/if9X8GUntqzkwVS
         Hq231NGU1Xr2+GoLRSa2ebBpFkWdIf3H77vasOjnxVfjytBdsXTYH/Art2wUuAnIKvh0
         o2ILH8JpqXx6bPS0EcOHq3/OkLJfox24t5oddyblrnzUW+ksp4cdL0lrUQeAjXqdEv68
         6o7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796136; x=1794400936;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hn0+1ocYLLGWHtUKY+oUvVlgS3nw9sVblusFHim9GqA=;
        b=Bre6tE/jqHiHNFznI2FteB/V77b3scHb118B4q5CAd8kf+K4VDS8Uws11/gzvy7qEo
         aA1rmx+xrWA/V4FtUfWR+UVQY5jklhAgba/QQHC71lV83pBefMUl+EnCNW7tm5TjXHFU
         XhUDK/Vbsw+nuXg4F5NIdsg+6HzwxVVeZoFJaB5DUMVQqS8W7Yss6bZMQCXqMeuRZhNK
         akfhyAcJlYlmSmr2KKx4AxC20Ab8VLszPqECq8qgwLwdjoLePOT0VNJgM6RkE9lN/hM4
         UjajKdt+GHfnx+hfw96wrko55V1EWovGwXtwOOhLHm3mulR+cZrzAflg5koHlIy6qL1N
         7H1g==
X-Gm-Message-State: APuU4Z/+D/SPGJ0XJtzvqaPWRwsTQRXRb49+NxjGJ/gefzojE/FqOJ4I
	wQKMTWu63zA0omOrfCV6Vjb8jr7TdF2z4Iy3QZAw3ueR2VxOyHRoAkYC2N9ktVu1NgSggr15Ucx
	pazkDSHbiMv6oiIodV17FXft+C79KFJjX/I/rMBtnOUar02uctRhwKwkzpXpyvKJ2VA==
X-Gm-Gg: AYBFou21rxC4vNwvWxsHKVjhpYj4miEk64V4+W+gWjQRxlemqQIy5To8/DcSst6Ua7w
	T2JfhSNgzP+AfpUw2wwgJzH2uRRPFUmT2cJsvSitWaEBwXQVCkIh8EidKtmI818Y4NyWjEJg2HK
	OXdkKAlYVsWzy7fbNPWdEAAooSrymZsxixEtnW3ykp+g+rW4A6IBy/eOmojr03u1trqTIi3ne32
	mlSamQtklNj+V8mHJzYdvsfGqKZoewVvHx22Zc0xQ3Ynu+MLKyM1j5ByPne39t7fdz4hzUAvbT1
	JxPdSwoaksznbA8Buus0++XTY38ksk24yQQZ6r2s4eLzTgXe4JH7E6QrqXx9tb5smou9iVhahjg
	vWZaSpEatR5Or8DO5xkWAzOID8brGR8jMnlN09qeyihTgUNj3WtfKalBkdesLEsBeHu3Mv67/+g
	y+7CBucw==
X-Received: by 2002:a05:6820:1c99:b0:70a:6888:2288 with SMTP id 006d021491bc7-714f2a22e1emr8458508eaf.63.1793796136277;
        Wed, 04 Nov 2026 04:42:16 -0800 (PST)
X-Received: by 2002:a05:6820:1c99:b0:70a:6888:2288 with SMTP id 006d021491bc7-714f2a22e1emr8458498eaf.63.1793796135837;
        Wed, 04 Nov 2026 04:42:15 -0800 (PST)
Received: from [10.92.198.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716c1317c7dsm1497063eaf.13.2026.11.04.04.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 04:42:14 -0800 (PST)
Message-ID: <f9ff9954-8e80-470f-aedf-6dd415b0e1e4@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 18:12:07 +0530
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
Subject: Re: [PATCH v4 12/12] arm64: dts: qcom: smb2370: Enable BCL sensor
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
 <20261005-qcom-bcl-hwmon-v4-12-50b9a8c730b7@oss.qualcomm.com>
 <6b6f7287-d919-4d29-b7cb-fa94aaf4dc9b@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <6b6f7287-d919-4d29-b7cb-fa94aaf4dc9b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JdQpPkKV c=1 sm=1 tr=0 ts=6aeb2828 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Uwc5bU2mXagv8lUGyjYA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-ORIG-GUID: fkyKinm9z6KxO3J-Kk27x6Ttg-Nt2oTw
X-Proofpoint-GUID: fkyKinm9z6KxO3J-Kk27x6Ttg-Nt2oTw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1MCBTYWx0ZWRfX0TATBXdmdAJp
 rBqb5ug8e8RNIqPBab7PrHvKG3ZIdbKCZ2aMupE5WbB4EOOYBDca5PbcJ6pCS8/n1vRwpoIIz5P
 Ig1jbIWSA8DCkL8dZqGEApE16R7TefatQ0hq/snFUVEvoSOGN+G56pH2E83e6hFsqJSrgR4qISi
 IvukbkL/OSOVMZ+2lnOa6foeFrFGciksjZEW+WGbD4qgrbRkNFNddhBBi69tXFGGrNQeS1B3+dV
 H6J89SI6G/nnIovv05Y9QeUdgik214araQNVTqEngZZqe7ecXCYG+iFv65tV79ykgJtG7cPShRf
 y1uK/WkbR0I4AUTM07Vrnb/+qQikZ3zqBGOaS693sO7028ZPNwMa7SkhBD+PP6M3hI4GcmcEvIo
 EvhTjI160ptSNJDJ7cZ4rcJkeXN0YS5Ri4SHId5TTt1TtqszfwqZBW0BMkKxoOG8+znvKomo4/z
 EBHM9HPu267D1da6kFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1MCBTYWx0ZWRfX3pFSNrFCyfgt
 SOBxSn+vrISN9kM5Gi0giHXN4c74wcL1sMQsvTTas77LeFM7raY95Bt9OYPFT8IBRJK46jj9VzJ
 DohLln9L+XvQqfLIEFXxu3hN1w6tBSI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040050

Hi Konrad,

On 10/19/2026 8:23 PM, Konrad Dybcio wrote:
> On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
>> Add Battery Current Limiting (BCL) hardware monitor node for smb2370
>> PMIC. The BCL monitors battery voltage and current, providing hardware
>> interrupts when configurable thresholds are violated.
>>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
> 
> 
>>   arch/arm64/boot/dts/qcom/smb2370.dtsi | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/smb2370.dtsi b/arch/arm64/boot/dts/qcom/smb2370.dtsi
>> index 1e02578e4ee3..4809b3d8cfe2 100644
>> --- a/arch/arm64/boot/dts/qcom/smb2370.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/smb2370.dtsi
>> @@ -10,6 +10,17 @@ smb2370_j_e2: pmic@9 {
>>   		#address-cells = <1>;
>>   		#size-cells = <0>;
>>   
>> +		sensor@4700 {
>> +			compatible = "qcom,smb2370-bcl";
> 
> Like on Hamoa, why just one instance?

The BCL peripheral is enabled only on the first SMB2370.

Thanks,
Manaf

> 
> Konrad
> 
>> +			reg = <0x4700>;
>> +			interrupts = <0x9 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
>> +				     <0x9 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
>> +				     <0x9 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
>> +			interrupt-names = "max-min",
>> +					  "critical",
>> +					  "emergency";
>> +		};
>> +
>>   		smb2370_j_e2_eusb2_repeater: phy@fd00 {
>>   			compatible = "qcom,smb2370-eusb2-repeater";
>>   			reg = <0xfd00>;
>>

