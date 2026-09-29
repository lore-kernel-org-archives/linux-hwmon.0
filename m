Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1624FE2C7
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687765; cv=none; b=uY1CyS01wFEZkcZ/7haQo1vwVL5robKA1h6OsA20XMUSeJOET6hEm47U21JYSb2dqpvRPXXr/yUr+lytcmYt/oaMl2qgYBFFq1MIU2y6zCo7yQKYOzuLYXYVMrHk7Kk9t5IMEe0B0RsigyqWkexs8CXhIErOVu5QcjhfKrp3o4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687765; c=relaxed/simple;
	bh=8C2QM8PCCveH2S1uREZ+hMj+7+Mn/kc2094lRJW8H44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PNNvYJoUF4VZZpZx3BUAmCwbGm78pnB0z4nK4JDtNrxa7BJMGmg+ovMK8jsJdmktDxqnN+xG7fD5ZtEfjDeTWPCOD9IM+f/bx3lgp+IRGtCxwBEzWSKTbTSX7sdAU3KIlXWRcnUTBxMyUS+Z0TjIb9+bg8e94qTDxwsLYnM2peE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VLJDIrii; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SlKyhfcA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VLJDIrii";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SlKyhfcA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCw8pB3301652
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:16:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xFl2aUIBjMMRWVsBPz1x55IM
	XDSAEwKxKurM1GPMbbs=; b=VLJDIriiq9PrV56sY1sL1ueS83fOBsA049yjnyq+
	0TPokCrRbnvIKGt/6CkNYUdNJe/1uG3L+TRC3pS72MDWE6OMI2jRdXOQbrlhb6VP
	5I35HltoQzb/tNlp8BOoGT4flYu8m6XpbPQq9Ovs88RR8UiG4RoPpp6n+EysIRhP
	pArvjWR9L1YpFfFAOU3eHGqYWm5/f9MnAP8EnuhemUdNQB4iiOwVOO8YmFE1atUb
	tU5ycMgy8STZxZOu5bRStu5RfKMFYvdaV8oYGH8vEeOGtUmydVUlotRkhP+2sliO
	G9g/0tMb7HLtgKBNH1xv52MrMGKVhyNWyWLez4eUmYc8ZQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0dsx0332-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:16:02 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-988bbb0ed9aso764473241.3
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 06:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687761; x=1791292561; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xFl2aUIBjMMRWVsBPz1x55IMXDSAEwKxKurM1GPMbbs=;
        b=SlKyhfcARdlx0e6UAjdQFr2DjHoXEt2ug8mQ1J/iRlYXO+Z5szSILBVgqA0yFkAswQ
         4dUTfrK+pC7RcV57uWVwhR4X2UbMw0lo6KHyRKX6RWgz9LeTPjdNBY0cb4q+jdGDFrjj
         LpbSozHcVUSzp6FhO2yJAKjHC04UlCY60NJnC25BT0FUqkD3B+9avkQ3PbcKb9B/wVZz
         FS31L4dRIz04Kv7Q3WxOJRJRYEOuGPHI2D4A+AIri2dCFs3mKOryVGlVVrNoCxP8FgDm
         gqCE+qFKFMuSvFx+rfCrTVNiaQYhlCrk5UkCCrfNA/mOsM+PP+Rvq+vbiOtWan0NPxeB
         OVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687761; x=1791292561;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xFl2aUIBjMMRWVsBPz1x55IMXDSAEwKxKurM1GPMbbs=;
        b=TgOC4V9H9F3ZRCtVKlDtZaxObEiHXQElgTnIURfLplqszDi1f9g8iwHk4cv8OaYWyJ
         cmtr14jqnrKhsizae71XCjKThfmKogzXAKXLu3yBegrftJghCopKge31vWjJ43q9bznO
         oZG/ecM6JDu5VRoaKdM1rkKw1LgSKzFqY4V/A0y9QOFlnGqsCthBiutyFtrHd8LUVSg+
         lsPTCSeiyYwi8bskd3faTJzL7th1XUcnY766PonMiagJTFelPgg3IiVGOQHZJtRVYlwQ
         E+5wXIf7CzGdfiO5cMmiFEKzcTvxNajVqIMjQPIuw9a/UtjEKFiuY97GDX3ap8U7glyP
         yheQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxwsBbGRSNifCo1dOua4j8zggNp9eAE2L4p8QeTIEp+AVZ79Xl53s3dW0kNZBUMfbSccsEENOQbkRYbg==@vger.kernel.org
X-Gm-Message-State: AFq9FYK53+W4L7yLOLXv7VDufcfpegqbDRU53UKRPd2YjBlfnvRrJZqz
	n1N/MHQga93kYwNbloapv3kYUsrJVqlIZ/v3GGdxumBKhd+hkOMLtst3AKd42qKaQmDJCvGU5aq
	dlGtisE0sXKYZFCefP+UyRBywe7eHWdzUpdwUm8co13wGu9UlOu4D3Ai1eZ2WH2aXRw==
X-Gm-Gg: AYBFou2lfYju/y3+qKj9YO/E55hUpEwPiKu1GGe8gFLLnaHHobqEQOdw/BfEQIHY1MP
	zkJCSMFN61f388FLj6h8csm5dqQBct7+dpkPS44sf0Fjnw80NC7LpV3rYmmjA50fb0K/fm8zxF9
	wg742mLCXo3SWwxgMVaf79LjXPmG8upQNYksrTvzatqQfcIL8h3nJrgPOJeuFlVJNL6dOD3/SH2
	atyVIdvoLBtNJGWlG7fiDFfhiY9zE5v4J1Yndq5UZcv3g/gCu01PhOOt8Xyxe7fLxswXOEDActB
	WY1lN7z+M8qqK1H8g934XMHOfsk2yaoAkdpXht6NzLVoFpd/4cl0CN8eEo1Ip3y7R+Y1b5ND30y
	HhvPVhN/gNToCeTo=
X-Received: by 2002:a05:6102:f0b:b0:7a7:ad9f:53e2 with SMTP id ada2fe7eead31-7af1b96d38cmr6642933137.1.1790687761209;
        Tue, 29 Sep 2026 06:16:01 -0700 (PDT)
X-Received: by 2002:a05:6102:f0b:b0:7a7:ad9f:53e2 with SMTP id ada2fe7eead31-7af1b96d38cmr6642911137.1.1790687760624;
        Tue, 29 Sep 2026 06:16:00 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af5056b1bsm3963646f8f.17.2026.09.29.06.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:15:59 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:15:57 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH v3 07/12] arm64: dts: qcom: pm8350c: Enable BCL sensor
 node
Message-ID: <szrhaamkkvvhwcs67mrptuigkmgel5jixo2bqgk6rwi2kn3jdu@a275fnea2vlf>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-7-f5ca00889cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-7-f5ca00889cf7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX/nrR0txSlvS1
 0T0rTzynYMDdmh5T8l9aOlhSCu3shQqtZ9SzNS6nXw7SCJZpdf0jo3LldEPab/rGRI/d1QlkmC9
 YeHdTCHt6hmTzTT7mzl/VAyoqWc5tcQt5qfO8d9D74ow/l+P0OK6/J3YMXx2IZsKjNMNf6tMVkG
 7YnMetp5jpHJrViGyMLxVXqwJMS8MTlzok4zX/WnwJ0bIEkI0+QEmgCxfxECDGCy8EuUVVSB1Nm
 NTtw7jVvaDrj5cnzRVnve+8XehlhKpFoWvPFLeFe4jmtMoAkApLJpFH2p+OEtJxVOxy4x4MzGmy
 WoTi6K4XG+2hagYG0Wr5Vhjp+9OguqM1r+hC3o0STYNkn1aFz34Lnu0LIkIhNtsCw3Zv1cPVOBe
 82VAA0h7RV3EjQVHeAgJbYiXtnbgxpg2Vg+ndUB91pD011ECxu9MOVKe1ZwCwGN1QJbDDMzBPLJ
 FTvjvYCOvHap2iVmixg==
X-Proofpoint-ORIG-GUID: -hxb5Uq47rdnQ6dB2RNr9PfV10z_EZFT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX1+Vjdp7MYlOT
 XXexq8fZyQ6rhvc0IX9KTmfpHfL8aZF7VC+nS9KT/nOADRxQSwmQkmiDUEScvMkjq7tt2opczNi
 JeT1XspSWmX2RX50ftYPL/HuWqjQ+Sc=
X-Proofpoint-GUID: -hxb5Uq47rdnQ6dB2RNr9PfV10z_EZFT
X-Authority-Analysis: v=2.4 cv=DqvDa2/+ c=1 sm=1 tr=0 ts=6abbba12 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=OAj-UWuWdFWybih5JLoA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052

On 26-09-29 18:39:39, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pm8350c
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/pm8350c.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
> index 1a24e6439e36..52b5fc1ef9a3 100644
> --- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
> @@ -20,6 +20,17 @@ pm8350c_temp_alarm: temp-alarm@a00 {
>  			#thermal-sensor-cells = <0>;
>  		};
>  
> +		sensor@4700 {
> +			compatible = "qcom,pm8350c-bcl";
> +			reg = <0x4700>;
> +			interrupts = <0x2 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "max-min",
> +					  "critical",
> +					  "emergency";
> +		};
> +
>  		pm8350c_gpios: gpio@8800 {
>  			compatible = "qcom,pm8350c-gpio", "qcom,spmi-gpio";
>  			reg = <0x8800>;
> @@ -41,6 +52,7 @@ pm8350c_pwm: pwm {
>  			#pwm-cells = <2>;
>  			status = "disabled";
>  		};
> +

Drop this new empty line.

>  	};
>  };
>  
> 
> -- 
> 2.43.0
> 
