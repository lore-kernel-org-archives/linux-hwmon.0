Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC6630E0CC
	for <linux-hwmon@vger.kernel.org>; Tue,  7 Jul 2026 08:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783412413; cv=none; b=i98g3Xl6mtrQ/9PADmPqSJ6wWpeBtEwcMDjO2mipnZlhbiyU9iiRGLBY8H4OIpZsAdQj194u+JJpBG70ayocQqfeHi6TY5JtBlqJGcZ7fQhVES9FVc3HFPRTs/dconHZqkGKMwgpKVj7uuPhxhPak0OHJIRCCBhh9tnWdMxT/MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783412413; c=relaxed/simple;
	bh=n5OeMK1bQ8yHLqI/ZoKerpO3/6fLbnwqt2JRjj+RJ4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lsae1uC/GVb2W+kXMTMG/VkbcRT1/wJGa6Kq5fEUSfVqm+GLv/gINiIiPuDpb1j5M/jmHkskrR/x/TeW7sTWZEbhedP4eBLcjwChT/YyGTgyJi+KNUISkiYVZF6TdtQ4YYNsmdWDiliFn8yPDuMbps6Mn5WSDUq2FqTuHxKSm5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OwR7a2IU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DWupFSWi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OwR7a2IU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DWupFSWi"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DqxV3209186
	for <linux-hwmon@vger.kernel.org>; Tue, 7 Jul 2026 08:20:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ajiWotAS1acnmFOssC6CEZcKuC/BL6UhgNsm6/8ZsA8=; b=OwR7a2IU4grZsFRg
	tJ10AyJ767+wHooZigQqyP7lwpzdi3QdLvIFSI4IvL3agnXL0xvBSDDMx7nbEbDe
	w046s+2s6XOJwzSDHgfaVnQDNoc/rmfbOQDjlje9RH1Ypz8ZJ5fSr4cEIzKCUtLP
	bEJiKt9Ysv42GJY9bXE/vKCxsfnAFfLK7UvWZ5Zjx20ZA1cmi6kdWRvE0MWwUQAo
	GlZaKUAFocOyJw1gCeyHUG9jpPzXc4tBApLe4hOpkB9ujldJD3nEAy30/fcub8k7
	x9Mc2WAvq+QuwW0j+jldxp+LNsSrO2+wBXd1+2MEmrkf5boAOistFdWg93RmPguL
	b9R5ig==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vdj8ce7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 07 Jul 2026 08:20:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ec235c7c66so50231546d6.0
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Jul 2026 01:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783412410; x=1784017210; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ajiWotAS1acnmFOssC6CEZcKuC/BL6UhgNsm6/8ZsA8=;
        b=DWupFSWi5kAwf/750V4ez4Qfn0FKacmv4GMhLlti/dNYGGJ4rQn3DqEKAnsTllxWej
         6d7bHVcMnO/ID4KhVnPxVQj1ZX6GcJ0TazJ6LyckjjdR3dIB1xyRDplpWMjgJLtkpZeh
         aL0fpszGEu067/XUDR4Ab0s0TonsfoBwObG0zGTT/esKHYg56uN5Sgoh3/mzmpesaunU
         8vOf7hoirmnmKxnDVNDM+JVCvsVauVegMcFkeeqxXAprzzH027zCnd/4ALvdsZqV/TYs
         kQgs6YP2yTrOu0ulwhRPE1F0xzo76gEz6CTgAiNTzsgD/rhoQu6cLkd7aoRrjC4fLDg0
         A8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783412410; x=1784017210;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ajiWotAS1acnmFOssC6CEZcKuC/BL6UhgNsm6/8ZsA8=;
        b=DrbHst6pquBe/G1UBs0isphWkBSZaII5prbq6Al+7fTFhI7TAdAKpJBTIygvyJ2H5p
         U08z5sSHSZiVTVdJV1GXc0wT2nIzANMDdkANAZNqKNdPxq2pK9QYDwf+sNy8hM4z/baZ
         Q1sqgN59/Gt0J19pMxsr+jXW5x2PSZw7qw220M9snV7ujYuGFGiwrgXvMxHvjkbL+TRv
         IRB7DWqXzUGfzFkU1X/PdBBq1x8bMMTTmKCDLeARBISsLXbJjKy7yURNh3wXwhKDl9rr
         850DpEgw+yY2FBG/gq6yAxBlMTr4odrL7vcEoFz4O1xkOgYqvXqmbNDUJ/eslP98JVa1
         coew==
X-Forwarded-Encrypted: i=1; AHgh+RoGNFeEB1l7rGJg6iERnXz8wBRQdIMAV3vpN/CGotgkHrCdo3t6IrVLoVcQruNSm3rVyq3oOjqXEznhVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3NOWIPoNEHdElD7VfLbqTKVKERZ+Sjls/eZ33klwsn9FaH+/0
	Cq7nGhY87JlUv9rLk7DM4YM2Rd9mAapLoGJ7ZIgPP4nWxQxdDoGOtovtZuLx0lCBp9XQgNUPtKJ
	EzuF/6heGOHmpaXS1VXfNlnOFWILdHw120qeehJlr3RyraOhBcRHW+en/iptYPHzHYg==
X-Gm-Gg: AfdE7cmU/PJ475UP2GJnqA7ZfCVzJYPccfe4Ue5EJ6x9NAO8wZ1d7XyQI6ia6CaopqZ
	RS3Zsc+LJk1mR0HhLQdWx8MpR4Nq+/CagP5L8mAeANprMIhfmUOeGzpFdhqeliKBLj9gi9tFimc
	iN3hl8cbXSvDBYNvPGfs98VtgqsyLx0dOrVSPHUwtzifjuYSNMUTPLaYoCkoHcASDb9JUX1faFE
	2WDqFSy4kY7H72SCrl9w9zn+bgpwbj23r6vD3Coys4x7BqDXP/zxzAmG09gfLZ8JcZ3NHaGebBr
	dpD7cBzOr+7ubSAp/GsxG4UEiC/QizwlkF7X4kznaxU6MUfCPxjLveR34n6L+OcDBF/Gpx5EmhP
	ID+73aqIqRtib2WF6b5EqhCksygy8GnwbYXikVCcsBK2kk3LmzY8lZ76Ag6OxOj8nh4P3d1bYuw
	==
X-Received: by 2002:ac8:7d0c:0:b0:51c:12bf:d4a6 with SMTP id d75a77b69052e-51c7487df08mr45476251cf.48.1783412409877;
        Tue, 07 Jul 2026 01:20:09 -0700 (PDT)
X-Received: by 2002:ac8:7d0c:0:b0:51c:12bf:d4a6 with SMTP id d75a77b69052e-51c7487df08mr45475921cf.48.1783412409444;
        Tue, 07 Jul 2026 01:20:09 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f32660sm37747195e9.2.2026.07.07.01.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 01:20:08 -0700 (PDT)
Message-ID: <38f5a2ec-ddc5-48d8-b76b-c2ed617392ca@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 10:20:07 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: embedded-controller: Add Lenovo
 ThinkPad T14s thermal sensor provider support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
References: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
 <20260706184648.35613-2-daniel.lezcano@oss.qualcomm.com>
 <20260707-armored-azure-terrier-4dc3d3@quoll>
 <8d579153-efa5-4c8e-acae-87f3bdfbfc24@oss.qualcomm.com>
 <457242e3-6a40-49a2-8d86-214f9167a928@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <457242e3-6a40-49a2-8d86-214f9167a928@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R7cz39RX c=1 sm=1 tr=0 ts=6a4cb6ba cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=qYa7bHtEPbO8xArO7mAA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: qrGD490JHIxMY8-8lnuhgI4y_aX69ycf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA3OCBTYWx0ZWRfXxk5WuJRNPeA+
 4z9uxm3YJ+SLgb2oxZn5SMT2IjrqFelYP2gHeGlOYvKO8tsJB1QmmyTGdfKVYdFYG7ckbOwx41b
 g9yeAK0zywVbq8bqC9SdH+RvFcqMmpj1bparOabjxHOnn2+gTCGFM0Zfw09+YkrSs83BHVwZ6fD
 3pRMgMte4LwBXAOD1TD89O3Svicduqw8U5lKyZK7+YunktgYz0RDvkS6uvKqJWwKMLhTd6NeU4z
 tvrykEnLAQkmcPJLberxf1b+P8tJ1ZiPXeT7YbKAX6Ak1Q0jM5dl0ZUqNV1mef29F2abGoQBBZC
 /mgBgYP+k9qO/Qy7PjvAgXXXYi9WsG08cix4qjCeT2wgApUMWUFroi2c3LDJHDtSnyb6Nj9X01F
 FO6gPetwEAGkKCjnk8VR8866DOXAov44Gw52OWcp61XtjY6S1ineuYL2NTu4XjJ+8rIQtqIufk4
 xsLyMegmU2i6SzlaFZQ==
X-Proofpoint-ORIG-GUID: qrGD490JHIxMY8-8lnuhgI4y_aX69ycf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA3OCBTYWx0ZWRfX1Qj1PO4tc8KH
 gquDU1CYIw/52jZfRbok0lLG2/fxpW4Mqg94Fytu1Xf3VM8HMSc2132a70kCONrrihXWpoCuEYg
 qjzWd4DZz4oGz9yIo8li2nZNWo2eWMs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070078

On 7/7/26 10:09, Krzysztof Kozlowski wrote:
> On 07/07/2026 10:08, Daniel Lezcano wrote:
>> On 7/7/26 08:38, Krzysztof Kozlowski wrote:
>>> On Mon, Jul 06, 2026 at 08:46:46PM +0200, Daniel Lezcano wrote:
>>>> Document the Lenovo ThinkPad T14s Embedded Controller as a thermal
>>>> sensor provider by adding the '#thermal-sensor-cells' property.
>>>>
>>>> This allows the EC temperature sensors to be referenced from thermal
>>>> zones in the device tree.
>>>>
>>>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>>>> ---
>>>>    .../embedded-controller/lenovo,thinkpad-t14s-ec.yaml         | 5 +++++
>>>>    1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
>>>> index c87ccb5b3086..0d049979e35b 100644
>>>> --- a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
>>>> +++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
>>>> @@ -26,10 +26,14 @@ properties:
>>>>    
>>>>      wakeup-source: true
>>>>    
>>>> +  "#thermal-sensor-cells":
>>>> +    const: 1
>>>> +
>>>>    required:
>>>>      - compatible
>>>>      - reg
>>>>      - interrupts
>>>> +  - "#thermal-sensor-cells"
>>>
>>> This looks like ABI break without explanation.
>>
>> What would you suggest ? explanation or removed from required properties?
> 
> I don't know what is the explanation. If this is actual ABI break as I
> read Linux code, what is the rationale behind breaking real users?

IIUC, if the DT has not #thermal-sensor-cells, but the code has the 
patch 2/3 then the hwmon fails to initialize as well as the EC 
controller, right ?
