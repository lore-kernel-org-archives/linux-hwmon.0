Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421575;
	b=xLKb0mtfydvIeNjB1CpS03DW4JUtbrQhT1zBp18SdlieWdSlYGXNyrIQwoyKg9APaDI1
	 uwBMsf+kNuQmxyMdjyQ7SR/TLTQ4pU/MIWxTK0ONFE7VQlGnhmv/s6w84cbN2kc4tdEqM
	 R31gND+OjGtuOUFa7mb7O5ZQUSw0H3tPj2BJRZ+AeM16X9IAugKX5PWjcCIbTx+pmT5hC
	 tSDbGLRVT0wnd0XTWL8Nr9dnzsfHl/VRj+eEyufUtdzCDbXYlwS7RuzvFCT7j8QwKvtYi
	 6ul0y0ScyDnjLAv0V35pcSH6etWWh+nrLWdbakNzXK7sIbW1DQJztvw7MNgOF7lTJLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421575;
	h=Received:Received:DKIM-Signature:Received:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZAvTCsWSNng8EghTQUQu/Tg9x/AcCtimfJ8Eqqx+Ujg=;
	b=3J2C54lKYJ140D7MPb2lO7Ah3Kbszt5KUk377o7dgGMRmWdzza92WSXM7tuWlUoA32+U
	 9GSvuTrc+u/zbk0t+K2auUfHKXoX3jicXLavYuArzNctTCbjadC49t+QBluwn7l5vK/iW
	 rTDHYscvCMhwXHUgKdApaUgnbUBMBcY1NYjWQUXxjgRziKj3IyhOt7QAmMcfthO6+cBTX
	 CbIEW6M6u/fCu3/0SGMU0LDCJfpL1cTG/AhN9dqUHEnQFTc/erlOpbBXPjaXaecQ+KX9V
	 nxF7DIAMFF9ER6GYpki7rsItlK+WdQmW2j5dbj+Th7ajvFqTseyEcW7A1QcjyH1Iwug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="o0H/27FL";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WmzJtK5+;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52F77606A339
	for <linux-hwmon.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o0H/27FL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WmzJtK5+
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185DE5008C0
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 14:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421575; cv=none; b=DTZp2dpnyw8yiruGmze9TyO/lswSTsyd7/RWB61xtiklyMtB4xLbN47lB4/U0NXF9vOV7hB03lnihglHbxOq5QEE+PktSAF4bw3uLu6yEVOp2hLsSkzwOnwyNv95ggRBls7mKC88kPcNpl2uRoctvIHTPvBNuTGaQJBsYrYCtJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421575; c=relaxed/simple;
	bh=orrAvnQKodrO0KGN/q1mi3EWkwR/z2Dn0RbWC+AZp4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bb88yRXUara6zRZ9LWErEJGGLhD+gL+zYKsVyMkvgX/TEPwDU38r6Yryf9+J/2u+GJFt/VSFhr5IHHAR9zEQA4ViU26X9cIulHqVouIMdSJOzjdZxwRDNRoLkbn+uTHjHpl3ILCRjxklqwadUQEzpnrxxsZlUWRWfFBoplyOhes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o0H/27FL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WmzJtK5+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0Dh92971073
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 14:52:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZAvTCsWSNng8EghTQUQu/Tg9x/AcCtimfJ8Eqqx+Ujg=; b=o0H/27FLsKCbcENd
	zuuZBR/4NyfyMNXLYkNG7wfXWl9TJQc5wQtIiqdnMyD4LVcYUO/4FGlBTHEoFGCn
	0mphYX1DZ4I3PFbjQD7EWFndAtFiXABmnzyH52QPRkSUWDYyh5DwbV3k13KMCwT2
	3WcoPqGuke8/owFkINPYH+7vF/NzXVuUx0IMwlkS3cbRZ89zwqbOvvEE3uSr3XBS
	nMV113UEy8Z+di+Z+3/ftstE2Wx5BXjBwzEaAV69Cahegn8ggIN0zO2Ydk8+nuJ+
	SRGSUyi3yQXU7aWoYyqXPX1e8+GoPOO4jyLalOeZ76xjuCEdaBILAyMIhgOwm6Nf
	KkOWpQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3x9s87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 14:52:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53630cded29so8296331cf.2
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 07:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421572; x=1793026372; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZAvTCsWSNng8EghTQUQu/Tg9x/AcCtimfJ8Eqqx+Ujg=;
        b=WmzJtK5+FB09lwKb27nYOHSRSUtjfmqrIx8F0G05H23MR1+CBMa70H/joJslgaLq9P
         aLr8Pe3svLcfbj7SizNhs8UOVQxsohGzym50rQ+2zO4izV046jjOkdYwepG+wB4X5mch
         IUJigmalNJWqPP1mDKzr/xS5dvGA8cOlHcQ5Pir3HmbGUeoloTrXkKy5UFgIDlDWyRx1
         dnKGPG4lh4DF0bYzr8+T2tOpnY2SdDXEGy3Ilm30075tZYdFxtRJXwzKb++vTcQp3sxU
         nCuA/4IKP8E9zEzRYR226IaX6mqm3vFToRN9fySm2pBpjkNvaPOXNXSLlAh4/prAFJ09
         GRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421572; x=1793026372;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZAvTCsWSNng8EghTQUQu/Tg9x/AcCtimfJ8Eqqx+Ujg=;
        b=O/uZbkEEsLFoy97zWf2akfiqKOaETYlS0q1JFUcd8fgQUh0VpVYhegmRHz6zyBU8P4
         RSlZasvKF2MXGLU9GA/SeaK6oWlHmPewBrKrz0rbwHOC9613tv/lpeDf3UP9wd2xsx38
         E65XpsPAP7nGiYHnpsGQEtKAXXh3L+rMOFLDdDOw3n9AOlX8wEb4qNI3AI79LAezniT3
         w3d5uTi3VyFw4zNL1qSTp4Xu0v+/KJxE5UnFFHQOCWCmn42QYbOObVGDGTu3g33niJY3
         fJ+Q4vwF8AdIF8tx8j7BX22BaW2DIh7InLDfABjpGBs/rdhMP17JFQA6GNpBqWvaT5Rt
         jamQ==
X-Gm-Message-State: AFq9FYKVaZIdSptXuLXxTKQS7Bi6J0cpXtdhPDqltDtRx7YcnDECOzDl
	i/EzVpBdY8lYlmZvxkQ8RddvY5CPv3KBCJsWwFTUXcTn4OOHUa4e76Yk5LFBg5gSxK+RMouyoSw
	BcAes0zJGMj8cyqYv2g7S8BiWp0pfCvYZpj9Gj2D4eO4BeQS39GgzxMJ26dtTpScQoQ==
X-Gm-Gg: AYBFou3bzscV9E8AJBdDIcKdxnX362D5BV31KpMabYSwfUOmtU+Rnq6cmeTuW7TiONs
	4Hi4vP9XxIBOx3V5JnbZsk5XH9OsefyFPcbB3LyEZq7IQNa00avtwQNr7WTlPN65+//oUo/AIDl
	yqUnx8wxGxj+FiIo0TQLFL5E9Nr1/3NsjP2e8Hc/xA45jcWiDbi+RW4+L05G4a/YM0A6X+JMl0l
	eem5duwjOxjBK+qVRszsRR5u1kZN5nZU+CKMOxYqgfwogxMm8XgXaRLe+RAZ+vftwjAi4DVmeZJ
	akfCuLewfuZAjW5i3SguwhhzE+LmstgojTCIoXN81KwQdwOYtAHCGQ0efzxJqO2QnJRht9MK0kr
	AS7bVnlC3lO4v6FB/1lnz6g==
X-Received: by 2002:a05:620a:17a2:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f29e1748emr1420801885a.6.1792421572235;
        Mon, 19 Oct 2026 07:52:52 -0700 (PDT)
X-Received: by 2002:a05:620a:17a2:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f29e1748emr1420796285a.6.1792421571699;
        Mon, 19 Oct 2026 07:52:51 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32c075sm380967066b.11.2026.10.19.07.52.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:52:50 -0700 (PDT)
Message-ID: <40bdd031-1d56-45ef-905c-32e706376d01@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:52:48 +0200
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
Subject: Re: [PATCH v4 05/12] arm64: dts: qcom: pm7550-eliza: Enable BCL
 sensor node
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
 <20261005-qcom-bcl-hwmon-v4-5-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-5-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Gv8exlpF3kJ0pGgb1Su8EmJddQhdNVpW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfXxIk8LXHLgLqT
 z406Bd/HnrLtyl5XjU+JRpBroqVM2PqaHnUFj2AmJKO/VVJQxdYG12fB1GZFSjMFfSMGhm19GLY
 iJKuUEzs0GACWi4tJ7ohHJ9Mx8vMbjU=
X-Authority-Analysis: v=2.4 cv=XPOl2ghE c=1 sm=1 tr=0 ts=6ad62ec5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=GBzGvGGi_yB6IOxyoawA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Gv8exlpF3kJ0pGgb1Su8EmJddQhdNVpW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX5PIolpg/yAox
 Y1G51aJGacxwxY1dk+k139SpJ1OQe28VeLHaAdxaDHbQh54ODS3VN9rTNPutfMD+tFFqov1TG6P
 w/VXtWriK367/f4EX6K3kP+6iwnd8e391XK8hPklRRaFp97mI+Xnh3ymNnFSKgjlTWN3PWjYvyl
 RlO9f/MH8Qa/wN7/IjjR+TA4qoRU/Ah+jEXPBCac+OW7rxqZJE0g2UgSagBrw2nlFu7KD8jcCNG
 C0EVnW3y8ALLtGkgIZfc0tbz9xlMy4NfZDABHUihpLXz5vyZgEXpn6moW187EN6sgWtjqC8RNrh
 oqBWDRpw07HTrGKSbZzVRrGn7/X2wt7U7BnShtnGOpLqw7sVonwNPADDDphiTzm7rQBj5rZWyDT
 kAgpIus8huMt4IXv2yBxiqbXDiybypTIlanitEZbfL3nPt1htluaT5zR9ZcREqtgW5QcPMr1KVk
 YcuU9Mf5CDI5UgNq1sg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for
> pm7550-eliza. The BCL monitors battery voltage and current, providing
> hardware interrupts when configurable thresholds are violated.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
