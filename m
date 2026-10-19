Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421601;
	b=RINUt/PvRZygIwTX6i4jLvG7N0I2Ed6NlBhn2Hq7cWgKN7Sag2IlHgmfuPI59iKxeXkE
	 ujxZHz9mlSsmndpjOk7hJYZVeij7lXIRJwOVLEOhybNhQ/6by06K7RClgH9t6Drw9jjtm
	 Nv/XeJ2fZftmbiNsREcZO9WC6vXgdqUQ/yHd+CieJifEFjmdQT31dd4F6HGfifh4Vf7FF
	 2ePOyo5AqY5nGbS7sRUQLdsYNgMKbym8O1hBmUuGEwmowZfdee6vnb8Qn1jPHI9z34JIa
	 XAcn4PU7nESnIjSMVw+907wf1kwxn2GgecvdPLlNFPcOcJMtHyUjbfvN8UPyRifyNUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421601;
	h=Received:Received:DKIM-Signature:Received:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hFMMKNRMDSpzNpvy3+kJ1EyZ7wJpKMIzqJUYG/JxNwg=;
	b=qaPSsIw5+m+3qTYq6BpZ9vZSyIH/+FgQs1IMPXChhaHhlbFxbO7QpTN1zjmi9A8twuja
	 FKI7drlSmUbVoxou5+NwGEJnOeO6I3l3KzS1fehyS+1eyFxoo6O8k6VUxSSxVaQ+sodxh
	 xkIMOPgAKbXpvEWLJ1POf/FF5mrgU1s4NoAAKsCsNB/ntwj1Y6TbVZUrmk9K+zSD6b33Y
	 TWqYNABbhh5KRBCvY9fdVUyTlBvkOabmSz2lgU3u6Vjj1SDzIjvfXFmNkGEYWciDHOxCg
	 rgJTX++AiS6vQhRkhUraF13nRYhVhMYXOaltK60soyWkbLH6W6Vzp1fzJRXM4+6d/Jw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="cXYZb/nZ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gmOih3o2;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BFDF606AAE5
	for <linux-hwmon.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cXYZb/nZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gmOih3o2
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD884C846E
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 14:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421600; cv=none; b=ljyQ4Bw6mEP50qUXzQBBvDFU7JlaOtItc6U2zhXSCo2GTuRbgkEXXB82cEr+q4bF/tObPhqVGBWsdXEm6R6wsQRMol+0R6sTUmdwE0CmP5RBb3KPpFryxTPS+I0ibn99oAEsu6aFHl5d4Aw6RzCB7hy0JxSkogxz5hukq/pG+sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421600; c=relaxed/simple;
	bh=VUJcuiGWrc/VTOU1ddPCEZGdzHccyfbVYcukszE+EZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M8344SvwJCaZTUkB+LhzbwZ9PIIHhC4hskCs7yQpjbhI2RgRqqq2xWVN1e4ZtHS+PoClCtLbqN4b2WKju16Sq2UQtWsz29ifTnIYc8PeWTjrfqdhRuogTL3zO7qZjuh3xTYKStkgzqDNLqScigtcVjbRuDNo6A7YcEd3DgewcEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cXYZb/nZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gmOih3o2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0RaL2925906
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 14:53:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hFMMKNRMDSpzNpvy3+kJ1EyZ7wJpKMIzqJUYG/JxNwg=; b=cXYZb/nZKZ0bU1h6
	1XNLExxGiATo/yC39BDOred/ABS9YYZHO1ffkSyZ+l6NBFihi0Iyqpfjrd/o4ukv
	l9NZGKcGfgemARpS0sBG0RSt/fiH93EBBbHgu0i5HTF1k+4zhEIh823EfZvSL98r
	vEHbp3rpO+JIyykJ7xNI94k1tfmDCV6THP9EqkzNR1KWiwN6VBNuc/AiAtjLy4gJ
	2VXpD5PI+f2pD0JcUR3mCHACkmj6y5if5C0AccwZAQjpYUsQ+c75QjP98ex+2059
	ylZoB4Lg214OTqW0gsodXtUQ/dQOBcAYcJ9LaO/8sX5TKMp0bzo7hPRj4wlgqexv
	ZjzYEg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5w1bbcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 14:53:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1f1f2ecfso75451885a.3
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 07:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421598; x=1793026398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hFMMKNRMDSpzNpvy3+kJ1EyZ7wJpKMIzqJUYG/JxNwg=;
        b=gmOih3o2PLdm/Uq+N7qG5bWkoV6Vs9V0M5Uuo8jqwAYAUglDOH8A2E53ZcBua/Joaq
         TKgd74IeGWH7s8+tPZCaSc85m9M45RtCcuOFZoprDblGeIw/tWp7SJ67uoUDjAG9lUxb
         sWecb/snIon9tikOEY3vBXL691Xlgy8q0FCIzvDS2HVYX++ksRj9W2myxJNIlH4vdv14
         UrJk8RAiHr1C7k2bA/4wgXG+Xv1jTfgV4NNLwm/4gK5lbzNQCvtbpR9W9NZCB/jElV9A
         PPiqAmT89uZBQJRjgXV/f56B+rtrlTPWD3oPM9GKS1H1sl0eutJSftcYMEfvROScQSSw
         +wuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421598; x=1793026398;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hFMMKNRMDSpzNpvy3+kJ1EyZ7wJpKMIzqJUYG/JxNwg=;
        b=Zm9Qvux1+9NFEIcU+ZvigA5Fwvt7AJwo6YtP8eZS/3xVr6sdluhVhp7fKAWqyGNO3b
         nQ3jIGVEwq0D5j/K8qF0sL7TG111qfNlQcbpzcH0DWK+nqFT/xw66Y/L6OdIrWektU+Q
         8lYUvFWd4ACBu3VQ1gTA2PwbSZWt22Bafofo1vZRDN83e8guIppAX9MTO7PEhMy8bfHf
         QeTC7/9oMlpSfdn23tj6v6FlDT9rHLulVZyFdmiR4L7Ird2TwxOhm8CmHjB4KRAN/LIf
         oG1OyuSl9AOsasJhPXGCD7TIt+x8pGxjucJA2L5hOqCA1o4zJWIsYQ25eksKqboNOmMY
         Upzw==
X-Gm-Message-State: AFq9FYLo0HE5gE1vmcB6xkjneBFDkfso1orZJP+PyuijjB7uQH6AEtZH
	7cpzMYhyIfKLPakr8hMdKsC6yjkmlTbQPEdq5JjF1mD0CLbQ5Xj/ibo9UiaKzUG109cJrAoq6VR
	CEKIp0Sy0JQyDwP48OikVx0HqZDaRidsc/6R3uuscUcK4xpv29pWn8nr/YI6qy8g0LA==
X-Gm-Gg: AYBFou1gxl/AFCNq4pELF/Kx5TP89iJuxSXneZLvGQRk9Qv2O49uP0dFA8YqHiBiX8d
	JeDRlkvkrMmAPFr75yJDJHbOggR86tSGMC3pm0SwYFTj2sRBDa7uweWxfbRVmdUbZ0M5DFXa2eh
	yOaVY6y5yevVDGJTSXo/pfd9RQbgbPUC8YgejURmfOyDdLeIyuz7gP1ls74i9kLWpUpVfJLIBKF
	qsq9FVkUYbGoOF86uX3QxKe6I76g8tnubxajbUxU7PFQNk/JcrVqDn4PkV1yFem6b4Otjr3cdpk
	CcwEHBfeHwi7Qc05w/2E8eHnBtfE1scjGwvXunugU8URfNDRjYaKkjvtH9WzLjwdxBBnehULaZy
	19zUxhai4gguuJNpGTu/GlA==
X-Received: by 2002:a05:620a:2602:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-93f29d3b758mr1480029685a.4.1792421597782;
        Mon, 19 Oct 2026 07:53:17 -0700 (PDT)
X-Received: by 2002:a05:620a:2602:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-93f29d3b758mr1480025385a.4.1792421597304;
        Mon, 19 Oct 2026 07:53:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb2f64sm365653366b.77.2026.10.19.07.53.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:53:16 -0700 (PDT)
Message-ID: <78fcb970-250a-4852-b514-8d3eabe535c0@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:53:14 +0200
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
Subject: Re: [PATCH v4 08/12] arm64: dts: qcom: pm8550: Enable BCL sensor node
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
 <20261005-qcom-bcl-hwmon-v4-8-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-8-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX7xW9DU2MFwSx
 B0Ko7zfVSP8EeJUHZ94dHmbggxjM+iKsiIbcVtG4a2eU2VnVKRDdajX8fUX4BWOBq9AulhVdunc
 JZ8siTd9Zaess/rk3jHL9ax7flPwaYc=
X-Authority-Analysis: v=2.4 cv=KuPYSmWN c=1 sm=1 tr=0 ts=6ad62ede cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=X6Y4kDKz15hUnpVYhMEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX37tphdzOYMC3
 S0oTA7gJZ0DRyiX6hmut2SrqTUO4HAGe96un5XTF1q/WYb6UrN5y+ATAnr8SA7Ud2NDDlTxwKGK
 HpgwcHtzBHbkzTj6elxcBj22wvVoYMxRpSVNAHAS+79sw8R319SzoZB+c/FjRgn2TPY7JA5AOpC
 d6OYOuYwb3xBLuZRAQWPdRXPxHtaeTeSYTNeKAt2Lx4xJEqzNsWrWip/NDzVWoUNVoJYRp3HVnI
 YPQGZfzUSJgdQtCDwqucFLc56+4cqMeLkhcvnVsd8bl7g28cFR/g2wZzmdWqa7ynJdm0jsVfl6d
 QFf+OjWvALaDK/9e3cbzWDYSEz61LuOuEm97Leg0O04E3dKpGeQTJpRkZ8R/t+VlKOTD+rbLHMg
 +YtaMXoXWs8rn1eXDABRhUDTzf8FdjXRyEvpVSzkRv+lr1ltXXmOb2e3igtRtYbpOerKGd19z+e
 LInhat4gxC4pzpT8TJg==
X-Proofpoint-ORIG-GUID: VjTjkA5STbjQzMilA8_O3rzHLwC05Te2
X-Proofpoint-GUID: VjTjkA5STbjQzMilA8_O3rzHLwC05Te2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pm8550
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
