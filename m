Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8535286D73
	for <linux-hwmon@vger.kernel.org>; Sat, 21 Feb 2026 23:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771715002; cv=none; b=cvd9IJwvVI7MEDwL1y0SQQYEYRY8xpGVq5t4MSZ3wsrql29JXsjfbY/hHKRPQo96kqiHhEQkqRSaCaQiitmr5dAH6KBDfbUBvY4kv2arACz4F+qgilMmHd0RgAqNiXE2n/LFtun6Y4cXj3gUjJLOC0kM3Km4NrwR6X2AJUeHAjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771715002; c=relaxed/simple;
	bh=WF6K8NVh78uZPufRZQJLFh1huKuqJ4ocCD0xUfY4M3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HsllAvm4b7Ip82U2FDER3XnXobBpKXTkVHQbPNLCNSePxO4+JfCNMKh3ZwPZhlLkMLhgUfwGJithA69YnNKZ8PKq+XDvifWreB0UOWykGMSe9r8NsIc6/e3nozlztcoqPGEj86qHUbI3hkk8vrfp+1akbff0KpZpT9yWt/jhPz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JJ5fwAJe; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JJ5fwAJe"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1271257ae53so2994177c88.1
        for <linux-hwmon@vger.kernel.org>; Sat, 21 Feb 2026 15:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771715001; x=1772319801; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1OlC2BNJohPSmbVkhvbzP8ZA/FR5DuvPVsmBlsvqYtc=;
        b=JJ5fwAJeXGGv4ZQBgRM+xw7LJWLoHuRWkzmQ1Y5F4SJvzdo8oGv1D12XzTuR0nhK+J
         V6+duLXFS6d8Wyyg6k4se/9zkgpNOSHm3zqX/PP7MU7Oli1uk9BPKZx2cyXofqJR3e0o
         MTXhK8FUZn1YclSkI/4LE5W/IIdc49qHVp8dadIeu6K0v8rV0oogMFjpf8WCe7GFMgLf
         KLEs+qjTV8jyavJwwX5qu0GFAn8y7v+zUnoaMu46KcRRNOWepP+Q+eyZHCidjjzTI0p2
         x5A7Ohe9JDimkSNJSrrYQZd9u9DaxJdcShas0fx6tZsAbn5di+Jum7zc12IJffxUsvqO
         WXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771715001; x=1772319801;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1OlC2BNJohPSmbVkhvbzP8ZA/FR5DuvPVsmBlsvqYtc=;
        b=m9aYqn1SAwxRBuNR8W+cFXLFJVyzbijjkd/aG5it7XyVRZH+qp/0LM1yZfhB/ToQjo
         iba8TEniYp1rGFM1ssyC1Fhp1DCYxCh25zL+AiF4HXabG3PniuBYq3Us8N8B1Z7ZETBo
         OCvh/ZblRIN4XQ0sVTinX9wmKv1lys2cHY866DspzVhfsMCH7Q+TRcZji/fPCHCjZSRe
         HR77Ko1i/k8oGpU8x9+jigQ4gd6Q6jJBHlY+L5tYwTyOL1mxwxwKBZBzRCOPRTHK1l46
         ovkHJD7pFwmscfQUiXlB51eYhlM+y6J1yVcMlMGa+93GFoQCOl5RvM7sztVlciaaLZIx
         q5KQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgawpILM9fcXl1WiEHRz5PLXeyNTX3RnTWA+oUYQju6j2UJYngcNcAw1M58Afn+3pvO6lGo1l8SPYSzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxA4griVF6wCgpS7rHTae21/YaQdSYbGocN3nYazEfoz8VhVRrw
	J99l/4zVwbQCFY1sVFgvAFO4aYdrqgRzm7LhNhLg9A9KnVaanMKYvr1U
X-Gm-Gg: AZuq6aIL0PL3b2UOZixxe/gH7+ucPEdJpXBvVDprr5aV4iYPWFENjVq6ajCEqh1cqkN
	uP31fhD/mp7uAT//UDWv8U8wjd1viBrpxRhCVR4IbwkG9cUJCzMWa+JlR6X06F6TaXE8b8unDTx
	fE2s5ybohUwciWcRmiPkKMgmyF3DDce/ASipie5wTuQNN3b/fl5/mpmINqO5i+/2OtMAKhkBFpb
	/L3F5FeO3g9eA8BeV2qAtB3c91sMt1Nj4hYF7f6E4R7f2t3NVd2VFD801KrETsyyzXTzTLSGDdO
	8KMtcckXcAtAzVX/7+SokbklsGemRP9hUBLnCnPGDekbjjBJ6aMiRKl4p0HzCIs4T1xI37Njrd+
	OHZSzJBXALiF/Sd5zZQ1uuCQPArnF94IldBLkhKeCWnKq39/urjygOlnMcFAIXr9Ypu3OgClTcz
	JHF2KdMt9pzLwd6pCtrf2/xRveo4VCMIL3mC1k
X-Received: by 2002:a05:7022:f82:b0:11a:23fb:16e2 with SMTP id a92af1059eb24-1276acb2209mr2076796c88.9.1771715000593;
        Sat, 21 Feb 2026 15:03:20 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af9f74bsm3039607c88.15.2026.02.21.15.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 15:03:19 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 21 Feb 2026 15:03:18 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Ian Ray <ian.ray@gehealthcare.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bence =?iso-8859-1?B?Q3Pza+Fz?= <bence98@sch.bme.hu>,
	=?utf-8?B?VG9tYcW+?= Zaman <tomaz@mono.si>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH V3 1/3] dt-bindings: hwmon: ti,ina2xx: Add INA234 device
Message-ID: <6d170935-7c89-4162-95bb-5c7b160f443a@roeck-us.net>
References: <20260220112024.97446-1-ian.ray@gehealthcare.com>
 <20260220112024.97446-2-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220112024.97446-2-ian.ray@gehealthcare.com>

On Fri, Feb 20, 2026 at 01:20:20PM +0200, Ian Ray wrote:
> Add a compatible string for the INA234 device, which is like INA226 but
> has different scaling.
> 
> Note that the device tree compatible must be different since the driver
> uses the compatible to configure the scaling.
> 
> Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> # v1

Applied.

Thanks,
Guenter
