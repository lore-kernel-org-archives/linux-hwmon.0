Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21846526A82
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688058; cv=none; b=aKr/N2x0T5SKIZ/NpHd2vd/CHoeHbXJ1n7ulW5lThCP0uAqyGy6ZKM7GBN1wkJM/IYrgIM5XFU/X9u1qaXCw7hEnPmuWrXPykhqVazuYvHGGCjFzx3zw3FEgiQziIdnuwufAgRPTxCCp0HKNCYtMbq43rihqJV9XZleKgCEtbmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688058; c=relaxed/simple;
	bh=ZMpTu/295f1t7G3xgjggbvrMYHbYURDz6ERPmIg/srY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mwpGUe+9O9b6PiwgPjWtLVoKrDyppkHH7Cm6Ksfn7i/P1Ihyz+YyzonEu5F7omaKuEJJtRm7eIcMZiZ9HdQEt6XpQDDY2ZA4x24nQr536CeUxxx1z/hMpKpDnHSsOz9alLu5HM7cPiH6Vl56x6oMdRQyuxKp5EIer/miDhHeTMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V8tp/IsI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PHyjYTLT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V8tp/IsI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PHyjYTLT"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqhTZ1477045
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:20:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uiXR4vqXtHt3NNfdCIw+vb1G
	U9DVCv4gGNveGtEDaaU=; b=V8tp/IsIkarQFjT7/0kqEE3ayC0ynb6LXhXr6Qg2
	8HmP6ssTAjNrsvz10dNcVac8j7ucGfzBh5D6zSgb2+4CXBn5fa8BFx6jeEEjN0ux
	CiT9UP1+5jpa+j7TM+iM9nAK7gXHz92+cs+IMHZ6/T+VWFYr2UPGZEVCRWhZNC1i
	w+9LhDEvC7Oki8HyIvvEZFHwWPqiYjP6mlhKwQv6qczN1KuKDgQT+R9JfZUqnMl3
	bvZS31ASS64Lzc+LuaKsvUsUtjxe3IDjIYL1+n81EybEGzdhnGuTLk/9eAK1Dh0Y
	6D3bZnKK/CnJYDJLmmBpr6JxgIa81n4Y/s8qEVqZqPIc9w==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyw03m7pc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:20:56 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7989d8ef4a6so564880137.3
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 06:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790688055; x=1791292855; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uiXR4vqXtHt3NNfdCIw+vb1GU9DVCv4gGNveGtEDaaU=;
        b=PHyjYTLTC2925S6ERgkPj99tdrLzd29+ystQhh8OTT7K0FS1GGVJBQB1+ZnUnZ54IN
         ZUrJ9eZuVve4dOP27AbNQBTR1eYMF3x2s1e0dCKzAHhOocQoU7BRBFswTdpRwg5+7aKO
         pYFjXXslWx7JZ3GLm9rlYFpmyObHtbIG32DCtLryD1+Lw3t73zRHxqpphpzCbqGWd215
         xNQ7ahXkW0YSMZhduX2Cwc+gjj7sFAsP4olxsXf96fzgoh/ogAYDM7jHm358LaPgjmBs
         /QWI7UpECak11ShNTWssT+qOuve7RZanbRF+UDDzR6cH+kyT1vId5NErOHd78XGazfER
         /cUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790688055; x=1791292855;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uiXR4vqXtHt3NNfdCIw+vb1GU9DVCv4gGNveGtEDaaU=;
        b=fFENkAfbNgOw7XF6Z/0k5EVRv1/4IctKcXC/dZerkvYJRehmULptZ++9OUWdfOILAl
         2CF5zCn35j0fvn9paFfCmUG53L4cFGEgUsjFlixbNICNJoH7cgAHKaFiXpw356uVQkM6
         nXtzo96YRzKXMn3CeYqMsCIlB++bub4h3Lx6C1GmaJb6iseoC9V5wh7HCdXJqZmJ8LUT
         u2DcB7asHRX+k9N+0FuvIiOonwOO0imG6mXiJFxWI3pt3c2jZmwgV95NSq8eNDzaTHXx
         LNZjNfzE9TQy7iErAmL81/TI08h8urwiudK/ZdGKYdDwUUo32R9RvrmZ+Y76TpwnvNCY
         cDyA==
X-Forwarded-Encrypted: i=1; AKwUvBxks+5y/T8jR1KzJsdqsDAf5rAvxx0fwDhBZj4ECoy6hwsoso4zxS/Z5DTBypFt36fVNH3eGOEUZpwTnw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIIoQOjXY9Bddx3pVLN4SLOrZvKbgGXAB8oMPT0ppmvMmOfJNK3
	oUBBFcpvOsT1kWvEqHE+anCFkVN0RoAQFp02rDXq7hdCLrcKUApTwNIP8NjmPiDZ/FoM4uvm31v
	JlC3GXkbnFhBBAvwNXjL2L74t4n7yDxYxHOfKU2qvo4UGB8AbCek+iCZf4v75Pwpj0w==
X-Gm-Gg: AYBFou0S1XjOqSOQCx/hbnvFo6gZ4QNa59CBfP2NOt6iRsunxoprZBq9/45KuIBo8Ax
	KFILHpFkrJ/tc4vpgUZf5mtqwr5NIq2iLf/zngGzWkgY3zExLB2Ii/eGMCkl3LWuCkP4SUboCGW
	mTt7PkW2Q2w8Z58WvjaTvbpjHVlosCAWkkE0og7rnSf8Q09dZVdEdmCbtj4hrmwQ8voOKLqg2sH
	9MJEtT3R0fgdt9aAA7iW7OzN4ZbnyQhfrobiW+F2VlDNHdGyUZRkqcRuI2qbXvWeMz2VpoEd1ao
	qLbEvODEwOoJ5hHfNqol6LEPANtyIonWFk3n6yDkxK7OErzexi8Nw2/BVSmyCMghmhddtSDgzwF
	/oBtzeDaLB2X8fuA=
X-Received: by 2002:a05:6102:c0f:b0:7b7:3acf:bd37 with SMTP id ada2fe7eead31-7b73acfe03emr1287318137.37.1790688054965;
        Tue, 29 Sep 2026 06:20:54 -0700 (PDT)
X-Received: by 2002:a05:6102:c0f:b0:7b7:3acf:bd37 with SMTP id ada2fe7eead31-7b73acfe03emr1287301137.37.1790688054292;
        Tue, 29 Sep 2026 06:20:54 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfe13a1sm77129355e9.5.2026.09.29.06.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:20:52 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:20:51 +0300
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
Subject: Re: [PATCH v3 10/12] arm64: dts: qcom: pmih0108-kaanapali: Enable
 BCL sensor node
Message-ID: <umsbcyd22y7cu6n3abjso2iy46bplui6rpgvmfpewl3mvtypth@cvy7qeaoxnwo>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-10-f5ca00889cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-10-f5ca00889cf7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfX4E9zC7vgyvyK
 9PPyELOHGf0nHFv4YfFvb9IXxfKHDJlAt8X/YYaVuixnVUsK9bEvaMtGmNkUCV64H0iEJ79kA8j
 rziRNM3bVnDuAY5KuWXkqIRqxQ6dmpk=
X-Authority-Analysis: v=2.4 cv=SIbXx+vH c=1 sm=1 tr=0 ts=6abbbb38 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=_ybYkvnUm3iZRZ9voNMA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfXxrihGuWWbvNG
 oZW3C/DyBrVM0nnAsGnWQyi36nfxwHYaOVOruaNONsGfyv5LtRiT+jOjHPH7yaDV1DziC9yIIbH
 Rn9RuKtNZE1egyVA2+PK9+1ZxoIUAiXR8Ffz3MkcgpwSYc6/PZBnlJ01Q3fHA1NAdj4sNJl+QBt
 ds641iHWlqv7sZV/KDHQC1K/aypaW23H6ECUbHFFq9HX/Ks5YhjWlgpYKdZY/27nRrewYbMLhh2
 ruiIr7A80NxIFhQq5+p+RwKT/7u+9ZI8RY9Se+m0WJmgkkbXSEZmHeFcVVy7TU2DVm5+XwG735j
 w928glQO8doXyM6JTIKWV8ZkPrpCNyKJZpd4trrB0ta90eNq2xybSlpb78snmC6CDA2uB+aESX8
 nWFLBoNCC6zjoJrziuXroT3uIV8wzRlbyV89jW/4Z7lkzSoxV3Dn93FOGYLZW/7wIWTmXVzsCcJ
 ezYnqVyks6vWnHQJtnw==
X-Proofpoint-GUID: oElpNWRlEh09xD0SAqeL9mRurTms8FGF
X-Proofpoint-ORIG-GUID: oElpNWRlEh09xD0SAqeL9mRurTms8FGF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290053

On 26-09-29 18:39:42, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
