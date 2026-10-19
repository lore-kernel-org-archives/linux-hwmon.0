Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421621;
	b=rwwcRkXoX0XOPlHpweE/rX8KXl2nZRjEmbyHlysn4iGxmpDFreWe01NedSkKCAKWhBWt
	 MJtJ81Bq4EvTxzJcirHeeM1R3kJb1qIhP3YHUbi+tq9p2zI7Su36tXJ3XLfxwGdlKl+sh
	 itAKJQK5miuZhb29RexYRPAE6L4sKZnJSMJKhcUmisbEcf/gRlUU4UubGJb0btk/wfjos
	 kZ6kmUfGz0nBNX4sCc/WePwWruOgHrF38zuAv5Hug2Rk+FR8dnKBN3XeuYnwhD//3Sz+V
	 Td63e0TuZ9n2EXAmjE97qUQlOqRE6knzG+VrRXqvtEYGSSb3/I5PFxFbLwsecTmTnkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421621;
	h=Received:Received:DKIM-Signature:Received:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=;
	b=tlRgBAN+hkshOHNRQ3e7VxR8evrkblWP7J26uIAL80LUDPJln0A9teSmDIwVfOPZlbwK
	 VTSZrDYyYJxiT2h8ovS8501wVuqtDi+MfI1T1JAeEbm3GQt3cv+c3mW9G5s+x/eLbmDrM
	 OfbQKHcb3UbmihpiP5Y1ail8ia/z3hJUGeLtSOQqHQKMhws023dHNzkAW9P43HCpkY4Fr
	 e/4p5lqPRulcZQLkFubYNc0OtcNa83mt9i80/lIHCIAaU/8+igmzb0ad81n4ViCbdWE/L
	 qKmP8w2yPVkZdbjhzPJAkDmvW8q5OplDDz6XOdvbjxpMSf2PMJQoK57Z9qmTQNdIb6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nSi9cEKv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X+EWXAWA;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F641606C15B
	for <linux-hwmon.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nSi9cEKv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X+EWXAWA
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8074C846E
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 14:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421621; cv=none; b=XE56vQu62rxLniEBl7xXjNukKatRpOR6q1ZuLBHbgJBAwMycmoAn8niflWQ3i4LDOktxeta3cvZlhBVh6ZQZGtJFJbjrSnZqbJyStCbccbDXb6jx4MbmFuGMt+ixxHGN+orAMRtfLp2NUNCL+asxHKnNuSxqqjIEq/E4883oE1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421621; c=relaxed/simple;
	bh=8QzhEza4cmQmxyVPqaeJPOjfbUX18+JD1Hl1uHqCQBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BZTJtCwyxioTaurVn1eOZU1eN10JCJ4G0JF8zpumWWCpNCGveE10Su8g4gibdciO0RUUUZI90s6yYkixJTBio1sF0GBVBByQI7oZPEqNRPYony3r6RwkdIttO391f3hoYdNhGcccTSna8rcK30CUKlt/HS0kNyFycU9XuemcqhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nSi9cEKv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X+EWXAWA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0fq41904007
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 14:53:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=; b=nSi9cEKvrnTAy8UA
	8L4nm0gcCkj7I635NL+UWzlhSkbS824yj50HkV1/ze7J4ovs/mSSkd8mexPnwtuy
	SpmxhvjIX+FOVfxcxdhOyfRgXJvy2V9WvgfNLnNiOUnDXqPiBXg1o0wZh1N19ydI
	cnwXAC68b0LzqGsC9ts81tKYdGOnt+DgHKSeROaBEMMFyA7s4llFFTLdh5KBw/XE
	M4r44Dd77on0iWUgk5O8sWBekt6aFIDYpK/JmPC8+E7nhOIFeTMQLRCQ8C+PInd4
	JfdPdltqtlDKuWv01JIh9FWFDE7fBswnRIVU94elAaoS/0mDzgOnPqH3EOInH89y
	R2W1xg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf5c9qjs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 14:53:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ea8a9cfe6so85509485a.2
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 07:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421617; x=1793026417; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=;
        b=X+EWXAWAt2WhZMCFyaLKwZz/mHIRka4RNahGCqwCzOnbr2qxsEQ2V+25E54KmYor4T
         wUXFpDNMqXUeG4SYLI+MAk6PhmV2aJddoKVpD+D0nCQBOigLIDMPokshkldwblE8DeXH
         o+ExFvBvn8I5VZurDandZemjPOlyo+c+cVpsNqpe0g5SjF640YBwLbG+5huAIBgZHvq0
         0fuMV+5uqULgNfI54SXHOLg3ZOtmflINuL1TX3ghB9RWTXTdprfYFml0hY0bcR2VBcgV
         k1jMqi9lLg56rdgrtUMdsfttLOpEr1jNGMqzG06Lp1ynA6eFnOMMnd07jaDJwvmV95/5
         Cv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421617; x=1793026417;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=;
        b=a71bEnR3QzsaOWvPGEOcH03lEN3KX2tFAlSVXY+qBpnQ57IUFfLIAwUubtQN3xJLnX
         eaB2uwmeRuIiTHVSPyRC/V17q2NaJQVWuI/IX5cwf+gmqCzX214HAtEGclDADIaxRiDs
         I3GmuwemcsGlafbvQEGyA3eB79Lx165QNGnbvINPntJM1lStkwhbYFekdRHTHw1Z1rrm
         5wh6rZzEB8uYvSicXm/OZvflZcqcEL+rNm3i9vjOAIGVsqQZiEdquSpqsceJJbKdBMoJ
         a2JoOXneClMWKpHt56bfimTc90uHRR1fg/u1OJNE6UqrfzD1/ie74VBNySuxDhjSTJdw
         x6zA==
X-Gm-Message-State: AFq9FYIxBDf0qc1SF5lIUTDF4OMVz9idIl9iFP8f79ZUuAMDtAO7Qb90
	Q90EpkbgrQlkGE/XVMnlYR/HR4e37Czak2xrEpNUG6aVh/ECRPBQO19LkXXmWhf9N0aaA0Tlss8
	KLmcNNJMTjlzJcGfotoIz8yuCbrJ7vPnsasj7qutlr8drOrKKOISPFhXcayMJya13aWq60w7itg
	==
X-Gm-Gg: AYBFou2YhhCTMPwDh9i8p6pgzRYC1qsvIYiDLe/bf6+rWtSPR2QbBsXl2mPVPASziYH
	bokAPCx+EMa6ybuPgOo2SFut5isRMR/7JN0jRZ13kzYgpfkG8kRc8DhFHQGvzXTOSdtqlPVWqwx
	TM5ekdW+3NodxCQa8kdEZLKlC13mrD9Q/qwjxtAaunhksRLqcPuRj+YazFacbA5yBsDczilS/ux
	EPmBI+ZKFRUTVK27yrznMt+/4/HzQOYzL4aKQ3+WEnrRYGeM+Umyai0m+REaV4KyiiyXGr2bWOF
	/N+SXSm3M10GW2qbFSJHdSM64QnXdAcahmzmz/YG4/tl2FVDyx3L+riDSWLS25JX3DXY+KyKBB2
	nbyq8sIr6/TUBmGNiFXT8Cg==
X-Received: by 2002:a05:620a:4041:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f29d7ea21mr1547815885a.5.1792421616964;
        Mon, 19 Oct 2026 07:53:36 -0700 (PDT)
X-Received: by 2002:a05:620a:4041:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f29d7ea21mr1547809985a.5.1792421616351;
        Mon, 19 Oct 2026 07:53:36 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb2f64sm365653366b.77.2026.10.19.07.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:53:35 -0700 (PDT)
Message-ID: <af21a2c1-f101-45af-8895-daad2ec3a9fd@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:53:32 +0200
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
Subject: Re: [PATCH v4 11/12] arm64: dts: qcom: pmih0108: Enable BCL sensor
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
 <20261005-qcom-bcl-hwmon-v4-11-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-11-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfXy3KrNFenXqjb
 sq6hQtWSf+DlxjkJaML4rpEKND8zv49L1hnalNcnrVgpGp3nGyw1kN/6fhbB4dqsYIByZJbV003
 /9h2cxV6BiQExUQOqGLLKIcHBedxk5E=
X-Proofpoint-ORIG-GUID: OkYSYxrJ-ucyOSN5gqtuJcksdQNBlet2
X-Proofpoint-GUID: OkYSYxrJ-ucyOSN5gqtuJcksdQNBlet2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX9SqWJ3uQ9viy
 ekTpFaeHsgekfUG5Tuq3T+/JxGzehTI6WoMyxG2sV+q8MBiOyLe7fORcYepe57uSJP28e1Kl1G0
 Hs/EeIjF4CF04LdEMX3YFvHyHF8bdC9CqAgI+yvj5KcNFO7+1fs34k5j9Jrri4vjZgTz2na7ik6
 2vdo+X9zlgl0VVy3xMvxXUtjas5EZjPlvuOQbEOZQ9srFreQxwBqIzdqByzN87aeZTVwlefcwZY
 5sMMwT9nG327nb/FFqW2V6DKYunatdpt4YoFrc7x40LFs9sjw0J8cvA9Zo1lm/F5hyaYfQD361F
 nqDHLz5reF1QntiWIHpttS7TsJXen5gP7avpS2+kCNrfmVayZXryClh/H3oPj4/KeFRiOj0AMeU
 caz6Q0UYLHAGZo8cya6kpypVgW7z+DBuRb+o0kmtR7/T+duROygw9jThWhhhbCi0zJM4plXl64q
 fLnzNsiUCySzCa/eOHA==
X-Authority-Analysis: v=2.4 cv=K6O3jCWI c=1 sm=1 tr=0 ts=6ad62ef1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=_ybYkvnUm3iZRZ9voNMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
