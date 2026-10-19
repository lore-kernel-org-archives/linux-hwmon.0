Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421643;
	b=b4hcZkVoNKrJd2Qel/jOLbGRlIquEeTBjk6PhD1eeJrTEKyk96O/a8OFtiKEDOWBUw+F
	 TYOu8xURsXDg90H+NJaua/Uag2olSYqAGYZe1YeVAFoAIeMPqrhj9dfTMjH0wAYl6XkFy
	 AeVN671hALHCv3jKhmF6u+l4BEdiQ9bclJt7m/s3TjpCwcv/UKMou7C7VYc81qXKI7/aR
	 WIQh0sVg/lzG+NqIVM2m1QZS8fJgAMA4xsbaGHe7sHcrRvrRNvwCupUv/vrV94XO+scgR
	 oKDK2M+MBNBZnYAEmb+BRjblipl/iFpoqNpF+QwDMppalIdtlNgMQN8rH7tfyW36NYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421643;
	h=Received:Received:DKIM-Signature:Received:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eK0JG1u1qqA7ghPWdXNrnsaSEhGioJpdcPdEtMTuC9A=;
	b=gb9g3y+xhYgm0EQNds4fnh6hKHLj1sEbGSC+r7/RfIZYOwNJdfWxHo2ZDzrlDHlu+yFi
	 1+Ggd8Jjvy+FdsB2rmj5RGiYab7a+QZb8nO98lar1f4WCJc1g7A3D2oDvMRS+8Stcdr9b
	 xMn0uJY560A5m+enbbCHCWasgBDwy/x/MX+jZTSUpjJoXZRVGGAAkMvZ4Rx4u7q1pdTho
	 9mfr+iIxqBSW3BTu5RLlJ+BWaKGjqBmiYYnONZIfS/DR9Jz4/VWa3D9w2iFRQHo7GbnXO
	 zP5z8dajKdVwbttp1AaHh1p5RC1ezwFYhtftUUtlNGtvS0dRo00Mfh6pC/a7VndKkRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JDzs1drh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NbjU3ILD;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4DCB606C17B
	for <linux-hwmon.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JDzs1drh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NbjU3ILD
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA53484247
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 14:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421643; cv=none; b=RKsKWGm1KD4A+PHS88oF+sR2byKTlRHdqidjHOHOedQYeykrx3V91zcEnzOnw1/zi7f3SAr4sVegXm6kmme2mkUHiY14eZYApruxhVNpiGFQDuIGF9JbuZUY5o/6M/9g8rcs5/dQX9EIPRQho8vGlnCwZeEpMLtcZhlHDxHbYgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421643; c=relaxed/simple;
	bh=iTgrOGbnyKTihKA/yOPRSWcSu2GJAEs2AInH7inLQ4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NFnY2WDFr5f3uXL3MGGyq9Sh5Ztnf032/59O3tRw+fOAcRxJTRh49qq4Vxt1VYl3fm6/xiONfzNgnbeI1S960YlTJMOjYudraZ6GJnruQNYu5NxhBKalrzYp/4QQkSPNJtVwY1DTnZLy8gCg4JkyFqwo4C+X8IZTXfpuwn1TIx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JDzs1drh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NbjU3ILD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0bJR2774664
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 14:53:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eK0JG1u1qqA7ghPWdXNrnsaSEhGioJpdcPdEtMTuC9A=; b=JDzs1drhI+XmFFj7
	A4+OLzDU4EJ3oOZ9o/jS+ZurSZEMV8nm3p4AfKzDQwCSY9Ifcb307NYxWEV/ov8E
	F5cITVq1QE0dPN2paRQMgTBlOlAgYDG4OtcZ7J7wz29LDE6muDYl6QYKT2K2k5vz
	BfrrBy4xTwNvRWgmIpFmrSPRspLtq9eLPOsLEHZH6YjOzqqA9JA/O6WFssI4xJZ/
	aE66fi/08ND7CQ+y3z7ihVJw0ZNoNATb0D041Mydw0qX9ydRXxHUilr2rEgpKbTW
	18n7TedrdF4IbsulGl39gtRf9kA0TGUvLI+kgfFOJsmx4+3c6zrSf7l1DqpTQ9cA
	Ah7IhQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur3bh2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 14:53:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92eebb130dcso55349285a.1
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 07:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421639; x=1793026439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eK0JG1u1qqA7ghPWdXNrnsaSEhGioJpdcPdEtMTuC9A=;
        b=NbjU3ILDHlf5KyCKvu+uEQ4Aq5ydAfBKqaufzI0ZRGqzOmlZaJ1CyNGI9rjlDYLGmH
         kNyp+hefIgBJaP2lTxucXLc9rB0Hb7H8YcsYkpfRJcg/AR/Zz/w6w97jAaIYA3OB28jy
         nuWa0bznfnxCAkukFe0yqkliSTGSyzeNkO/ekIAwz4VL56b5OCes0k8H6nPe7Q9dS+pr
         JOnUXG50aFNHaY+z+IHpZAycKunvQGH7Sg/i8nnQ+e2YTryl4DvDvsDYpqj4Is3RecOB
         uxrJabFMXY+bTE71aiUDcC2ijw6F+LOvfDhnRO5VPAmD/6ArMbB8pX+xEMssnR32Qxuv
         6WcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421639; x=1793026439;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eK0JG1u1qqA7ghPWdXNrnsaSEhGioJpdcPdEtMTuC9A=;
        b=2w+CigvcB85fyB1aQ19HFrFw8gxGv2qsOSZIa1GUHcLjUJednDUskGsqRQ7b/SLPQY
         X6INkXn8sXlPjSsvyDx1F4XDOaszA1u7L36vL2eOQ62mPwx8eW6mjCkkZUK8JAsb9j5+
         dfdu1J2dzAAPz+KuBAyVKj66VNXNnfThwn6Hq31iUbpLbzpXhsu566eTKzOL3ceRfrGz
         O1WvVUIdJiet2wd4pBELqVeEdTMs0DhWq/5uIgIiDB6CydT1rX4hFs0fo7UlS22efAPu
         zcJgDazcSrv9u95o+u2ECiWrxVkadYHd7xECXhJyQcShQ0hq7INPyYG1DzREwxAbLOE1
         mz8w==
X-Gm-Message-State: AFq9FYLRXTVDqoQGMRGqvH+NxQmHN3nYf0cXpUD0ADGcXw5Rr2oP/2NP
	tdq/1eJkTKCMlfRkK29lc1gp3cAZpmPsOfP+nAr9IfJWkLmchJDxqjaWFbTP4zg1K6a3aIMj/8Y
	8sy+4TtYhjNkVnxgiRQuQaHOzgrEHxpwYXAj8EbOdhouVKAMkRKpcV4obU2QDw1EUyg==
X-Gm-Gg: AYBFou309ZGs8Nm4wquzVzZ0mYShwyNWhrL0xIWwLzRPYaG85PjUZCocxPhYoZy9ejp
	8NgfQDBU/EQn8v1Fzyib0sRwfTTm/vAjPWvZHSXff7tZZH+wdrfy/VYENP91FNtAfj4H4olE11F
	Kb0jFVIJgg5ditujq2L2MrlbWh2q85p6VY6qqKOUIDL8xnEBkVpA+pEwx8Vwfa0VuShKsNjEsz1
	RleqApJg7G91anzDOqfS6h/Gvp2OnPmtakK8Su+ILZD5d16fOK2pYvbJxHBlyxjelnozQHd8G2t
	QKJOpAcezGCYDQc4KuoGyBq6Wp+JZnVSmUdXKptn89V8GYU026oVPvHSBOnEIs0pBu1FUS8qeAN
	I3abkkqjNiIbiIloDzrYwgg==
X-Received: by 2002:a05:620a:3711:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f29c95919mr1529447285a.3.1792421638787;
        Mon, 19 Oct 2026 07:53:58 -0700 (PDT)
X-Received: by 2002:a05:620a:3711:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f29c95919mr1529439185a.3.1792421638223;
        Mon, 19 Oct 2026 07:53:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1c7ff2sm4047490a12.19.2026.10.19.07.53.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:53:57 -0700 (PDT)
Message-ID: <6b6f7287-d919-4d29-b7cb-fa94aaf4dc9b@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:53:54 +0200
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
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-12-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX+8yJpzpyrxp+
 MIcrEGxqAEeecPUvN812UkLyJlrvm7eKDUWUiDyD+hk3nzMxNA6c5e7tPWP/S0vVRnBL/shwRRf
 A37BBoBh2h1oyNGgMR52hYlRlnkwYHc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX+j57zlDb19rn
 uDZwMYVVaWys01qxr1IesOC6WFs7Qo0tnCwyUsRwPcgBrZR3kPS8sT8o063JniqBkXnOZkbMf0A
 qHum1+B/SLHVoI7G/suDVlcyJOEcS/OTsOGGALsEEiq9OwWWDqm4ss3Ss4AYdK6cuH3yzenFjMG
 rpR8rgHpgx9hqLVATqYpoJT/6dqxttYjo0Zfupp7xqrOhmpaAziesgmwtXJJSBmANPh9fjM1r1e
 tLYTrwa2gmSDBCBWmXqH3UlTeRznpt+YS8N7P6rwD42K7MyNfeUh3oHJGTTtrvcmX/eSAd7YEyp
 /CfbTXdP6iifc2vo5PKV1Bd38i8e0AY91JhtZfom/DtEb8V9Oq2y/CUeAfrvZsR98L2Acg20A9f
 4VH7LzJsYV+zVsI/W+HaeWXyklr6/h2S1AHwRPxk7gmd3YiDcYRdf92UuAvJE5/8WuAfa6LKEP9
 eYvXtmTHMWm/02V3v0g==
X-Proofpoint-ORIG-GUID: juUudzrQ96mhQlmmama4gyHp0Rflkkbd
X-Proofpoint-GUID: juUudzrQ96mhQlmmama4gyHp0Rflkkbd
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad62f07 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=55-3qADWK09jOtsAc_IA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for smb2370
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---


>  arch/arm64/boot/dts/qcom/smb2370.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/smb2370.dtsi b/arch/arm64/boot/dts/qcom/smb2370.dtsi
> index 1e02578e4ee3..4809b3d8cfe2 100644
> --- a/arch/arm64/boot/dts/qcom/smb2370.dtsi
> +++ b/arch/arm64/boot/dts/qcom/smb2370.dtsi
> @@ -10,6 +10,17 @@ smb2370_j_e2: pmic@9 {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> +		sensor@4700 {
> +			compatible = "qcom,smb2370-bcl";

Like on Hamoa, why just one instance?

Konrad

> +			reg = <0x4700>;
> +			interrupts = <0x9 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
> +				     <0x9 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
> +				     <0x9 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "max-min",
> +					  "critical",
> +					  "emergency";
> +		};
> +
>  		smb2370_j_e2_eusb2_repeater: phy@fd00 {
>  			compatible = "qcom,smb2370-eusb2-repeater";
>  			reg = <0xfd00>;
> 
