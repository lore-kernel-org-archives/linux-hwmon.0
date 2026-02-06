Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CA4354AD0
	for <linux-hwmon@vger.kernel.org>; Fri,  6 Feb 2026 09:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770369108; cv=none; b=G5fb6xj68re9+l3ni6qmXSZvC0qsdVJpm55hkQrq7FSg/HMAWDOqA0OCPsamwgUCiipkSBuxvFk0S9AsVwqeLeQRihpv3AHukPVEwEwiWXisKC6P+2Djyn5pUWg23xpNRz9cYYHqB8ODAMeym2fNueqdbUQXdp6QchQCQmWvWbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770369108; c=relaxed/simple;
	bh=Qobkgstg4jim6MxKUCBWoLcPEdL4TRW+k82sMjr58q4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X4S7JnyYZHWTWt60SmqS1RAoXAACpd9yEWKA1KvGaIBrbL8l/RSZVddCQjTmPZAvCKtgAoR9yKtVBht79neG7+ecpUybuFfppCV9HUxWyysTc99FpvCrSqUXLExtH74ilLglFlBTTX0aisGXKM9ETpRB1o+VgyZ7ls70s8MEvSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KnK/xRoe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hflRHzkw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KnK/xRoe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hflRHzkw"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6168aOEQ1419772
	for <linux-hwmon@vger.kernel.org>; Fri, 6 Feb 2026 09:11:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XUdof4el6Kjt7r5sJvWGFwX65pxh28RZD7+N5QBc63U=; b=KnK/xRoeUmimaCWY
	Tj2/G9t02amF/qfZxVEs7UC8tOws+hrG52AT8vOp5vRUEtnlyAETm90HtCCo1Fc4
	fqQsVEdIMrqWB+7BWIj425kTG+PKgvHtN5lgZ2DtWRb9KuMHpaQOO+jl223HAkWL
	eX8smBsWg+UNNmue9JarEnllync+fD2wWjc7RE2lemrMpN9wrvhnObasZEByfAII
	nr0/pkxXuERcxYGwhrXP6AccsV0yFqetCCyNAUiW4V4gfRmmotLcbydOOkxZQ72e
	D69Jzhb0KLrF+pBRVn6QmD+ESNojSnTj/CDRMuiQLn0rNQKhb6bN2oUHdWbZ07Ng
	xaF+kg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c50a9amta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Fri, 06 Feb 2026 09:11:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2fdf3a190so35176285a.0
        for <linux-hwmon@vger.kernel.org>; Fri, 06 Feb 2026 01:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770369107; x=1770973907; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XUdof4el6Kjt7r5sJvWGFwX65pxh28RZD7+N5QBc63U=;
        b=hflRHzkwEQF4dGumB1VkM7gY45NwNpYwdVS7vG72jdMNJAZ8QWFOGinl1SbCjuliDH
         m+FMRMHjg4UPstxrjOTeRFRi6amMVWYZ/sADjO9a55i7T4lxr+HGzssOmKHK9EGbMoso
         g1muLBMBjrnZa54YnybO/8ncle1CY9nC5/TI+k4PPDWPe03qrGuS+CcGu66vK9vMKzp/
         bqB78wpBKhNIPFTKJ2W6o8JawT7EqUmwEbrb7joe0JOuY00IGJ8z1FDxxW/d410uZl6Z
         Kq9B1j5jVvUGSQN8BZebJ+c6NAwUphWWwpK7jQEvI20nGqzP2nEJa3vuwulNgLcTbh04
         l/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770369107; x=1770973907;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XUdof4el6Kjt7r5sJvWGFwX65pxh28RZD7+N5QBc63U=;
        b=MQ+GsOJ+RRL1l3qrVmr4OLP2SHlLloAoD11M5BqT6GE94McobVhr4svGI+tEJPEQTK
         4GLs8jijWmAk8nCEO6vYwlKxqRWWuJMl9cdHAD4IgAOpeAFyiF1dNcJhqNa1FZPnupVb
         GwZ//fs+knJoTvTMF878ctcDwy9ibBfCum6Yp8u/bOw9StSFZ3DXd8JlUh67RYGckMGn
         Itn+4WXTeHKfzI8m+Ny5/7SR3CxJ2GyfwGBGWOYk4IjqYR+56+H7LvgsUgJCLT5MMVbd
         jjLEArKZrCmm1zj5+e1DIjRzklKltGwa6hdbbuAR3+yt3bYykB133hyHsRGV6tFpFhyi
         yysg==
X-Gm-Message-State: AOJu0YyCg/aEJ020FmHvdGJfVrg2NEKCQYvPHTta4uEPMQiILtyYB2vP
	ZB+u4wb3/6W5WfyQuL7dhOaaKxSwlYrvKG5vCJVTSYbjtIuJwb2HUntDl5IRVHKi4uIU9HYNNqF
	5d/s+HqabXr5uxYF112TLCtfsVaRK6pTDqP0zFEXU+ZOKnpPcWZG/Hnl6MFQnC+Oe+w==
X-Gm-Gg: AZuq6aIReTo0y4C0stWS8fT8QfciJTk0tzoFVc3DPUkW6obl/O7CzH9PKdF8lOKbmok
	Z+Ua/dKW2ycmkOSkqGDi2QO8rE1Pf/yIDaMurIcs6TejkdZwTBQeITqkWH112dE75CbrHwpjaFm
	7OnAzh6+i+0KccMxq1Bx7lFcOgk+Jq78uKXRe3+JqPZVxCZ0vf/elLP7BszVZzXhxTgf8+shDtY
	3yll6vZaOkSxw/B1busw7yLt9YE0faBSEQ1JyrcpmtSSaDn1uS+RmWord8b+Yp3V//D2U5URd5g
	28gfWFmMZOzsMjl4wMy7OwzOsEfz+/vMGXW+fOtZAfrN/l/Ven4wIJ5KTlaZh5BeQwXiCv+/1K+
	OoqBMMtKolsLVfiiKn2Pm3ub/tdmnEkto/8OrLX23+sRtuVB20NI66KgPulRazH+uUvY=
X-Received: by 2002:a05:620a:29ca:b0:8c7:1156:efe9 with SMTP id af79cd13be357-8caf17e40e2mr175879085a.11.1770369106765;
        Fri, 06 Feb 2026 01:11:46 -0800 (PST)
X-Received: by 2002:a05:620a:29ca:b0:8c7:1156:efe9 with SMTP id af79cd13be357-8caf17e40e2mr175877085a.11.1770369106273;
        Fri, 06 Feb 2026 01:11:46 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7a3004sm67451466b.15.2026.02.06.01.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 01:11:45 -0800 (PST)
Message-ID: <c1a9aec2-0389-4a24-bc28-75be04cc91d8@oss.qualcomm.com>
Date: Fri, 6 Feb 2026 10:11:43 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: pm7250b: Enable Qualcomm BCL device
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260206-qcom-bcl-hwmon-v1-3-7b426f0b77a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: u9k0lsEc7A1Aj9zTtazhXIaRehg_ZrQL
X-Proofpoint-ORIG-GUID: u9k0lsEc7A1Aj9zTtazhXIaRehg_ZrQL
X-Authority-Analysis: v=2.4 cv=e6ALiKp/ c=1 sm=1 tr=0 ts=6985b053 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=eb200YweA7kxUedDXicA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA2MCBTYWx0ZWRfX/5aR7ahN12+O
 pR3LzY6vNB5QZ9rz5hzkFBou33ty4yu6iF3OeP77uxjEM5Y+OYvQdStbt1UHJDrxY5Q7IE4GDUq
 kZs1ZtszNMUdT5vzwS9n1h4uVl9b1MnAuprZBNr9I3jLf7y+NAqvoEgbEonLBPc9r+T9aINtpui
 cAnR/XSOJzk0yCc6uwm1iXxc9LG4ZyvIYZiJuJ+MU0LJYvdOxFAUP5kWPPAow0l51G2BTRM4sQp
 E71Qw4P22ERPw2kc3/nCtxOKIuTrrGZmdhvG3xouCNmY2ATJpPz6lM9Dc044Bp2OJUSvhvLI0Dx
 KwQ4N3fDj+jvsSXDVF+521qgUAaLVLZsL5xn/8LhrPr3UYCPm4aJCBPhebf7V3aC1btM5pluid7
 ZYgAQdIv86a48PbsyNGlJEaWzjhb2Y3fFzXrvOek0Yp4wTLwB6LbkwcxkCTCVLBeSM/+caC1s7X
 sgJYmyBOmhWTeoRUNTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_02,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060060

On 2/5/26 10:14 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Enable Qualcomm BCL hardware devicetree binding configuration
> for pm7250b.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/pm7250b.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> index 0761e6b5fd8d..69ad76831cde 100644
> --- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> @@ -202,6 +202,16 @@ pm7250b_gpios: gpio@c000 {
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
>  		};
> +
> +		bcl@1d00 {

This should be higher up (the node above is 0xc000, this one is 0x1d00)

Konrad
