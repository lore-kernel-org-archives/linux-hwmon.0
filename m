Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26C528EF;
	Thu, 22 Feb 2024 01:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=71.19.156.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708563660; cv=none; b=vAKXRW6iqhu96cTXielP4qV4UdMdG8VHV9DIxdiwfjKV2jPs4LeXZnTu2jcqrGOO59pq+klCmfuUH8k0nNURakEqr6xmQref4UXwdactZCBzxLMrIt1HqiNKLxQxwmoxaH54f2uC6/qvObLJBrMvN0qaDP7h45vze/IrDDjI5lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708563660; c=relaxed/simple;
	bh=cD2i83b8Ha4nSxdN9LDmQVw8JoMYX7ZQQrHcrlA/hqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dV09Fid9g8FBYoFTi6MB5u+15nWH7oirl3L4lODeErOAipP2tCkCFxvMdsAfyckJhCp9QIySMSYF5u+AceR8g1aW/qY2IeMZd5q9mS+uZGSgn7viepCQFXJNBI9GfuMQqiaMCEDRTETaWO+qEBq7DdXZS9/aay94foHsORhjAnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bewilderbeest.net; spf=pass smtp.mailfrom=bewilderbeest.net; dkim=pass (1024-bit key) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.b=PDX9t50b; arc=none smtp.client-ip=71.19.156.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bewilderbeest.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bewilderbeest.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.b="PDX9t50b"
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:712b:6300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 85E8D73D;
	Wed, 21 Feb 2024 17:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1708563652;
	bh=h0jc/OdAL3LAJdChikYYJE4lBxyIpD+osoWdj2KVKkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PDX9t50bpElsRWI5kuM8iIFUvoDIaWKnQnZGzqLumFEkFxxe4W0wlik+Kx/vIp8cT
	 hiQPiCg9Bs/Hhx6UFpvBjDex75t0o7+XDf4oCBXRb1lQxio/yeayjV40m5UhWcgbpV
	 JSthYgjAUGOPApfUHYnbC8siFzZ+nDgBbEztgY7s=
Date: Wed, 21 Feb 2024 17:00:51 -0800
From: Zev Weiss <zev@bewilderbeest.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: hwmon: nuvoton,nct6775: Add compatible
 value for NCT6799
Message-ID: <5924d0ff-4b24-487e-a58d-31977c2919f4@hatter.bewilderbeest.net>
References: <20240221155158.2234898-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20240221155158.2234898-1-linux@roeck-us.net>

On Wed, Feb 21, 2024 at 07:51:58AM PST, Guenter Roeck wrote:
>While NCT6799 is mostly compatible to NCT6798, it needs a separate
>compatible entry because it is not completely compatible and does
>require chip specific code in the driver.
>
>Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>---
> Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml b/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
>index 358b262431fc..e3db642878d4 100644
>--- a/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
>+++ b/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
>@@ -25,6 +25,7 @@ properties:
>       - nuvoton,nct6796
>       - nuvoton,nct6797
>       - nuvoton,nct6798
>+      - nuvoton,nct6799
>
>   reg:
>     maxItems: 1
>-- 
>2.39.2
>

Acked-by: Zev Weiss <zev@bewilderbeest.net>

