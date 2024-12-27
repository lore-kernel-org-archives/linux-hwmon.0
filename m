Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393AC153835;
	Fri, 27 Dec 2024 09:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735290396; cv=none; b=Y10ybatVQWcvoWPahgPK8MYyr5ysWsseyahXiDcl5I1mYAGooYlb9cMFomgIkEW/8qTTsHWcbGAANRd/h0D3su/g8tZ1/IRj+zbwjnIzyNltaZhBXaqMgenhSqHymQ2r5RQcJazRO2AzhQqEV7k5PnXdv+ed1TpA/eim42VwQ4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735290396; c=relaxed/simple;
	bh=+HAXub7KdKukdZMcSxzpAc/9QGT6YaLf8++bisLhM68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TEA8iVVsCDgtTj0aAMPtsLPZ/BNHZecAzNm7qtV23+b4D/eEYy6rAMAZXsLB7ymxXNwu0j7F3A+1xotXR26KYQIODhR3h1rGGzccLihehvpl33NV727ZbbvLkH63CVmS9cJsXrgVR78w1czmFdkTY8CqMAG9yAz5dQH/x6LDwzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EzCCXz9b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EzCCXz9b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04294C4CED0;
	Fri, 27 Dec 2024 09:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735290395;
	bh=+HAXub7KdKukdZMcSxzpAc/9QGT6YaLf8++bisLhM68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EzCCXz9bFOqQNPzHfyDcqTCdXqG9m4q3mgq38j769nhPs1cfR2OreTiDALRvG2KOL
	 ad7dD+zjCd7PkuE4TJR1KR0nilMEVFZRd0iLtyYiRJxzCL8YQ77HKsuwQIiyG2HUio
	 XuUX1AaOUTipu9zhv3sruwjAcpLcgSgjNbc2t030QZHBP96g9g+t4F2/KmB0gV1fgI
	 ksUVpZg0hxqSF3VFsjWPKTbC8mZq3DSFIRcGgl6EmT6BBidPRmreXgMaNFi+Oxq46W
	 adaD+YcuP1TrouhPax9c5HidrAhiH56IDhCoT0zsXQG9Z0YmDiNXeDwrKw0ivKmp8t
	 UTPVOoPqCjstA==
Date: Fri, 27 Dec 2024 10:06:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wenliang Yan <wenliang202407@163.com>
Cc: linux@roeck-us.net, Jean Delvare <jdelvare@suse.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] dt-bindings:Add SQ52206 to ina2xx devicetree bindings
Message-ID: <srkay6cpegcxwx6q4jexs7iajydqqossfjctwoq3tctsanruxk@t44w4tbq3t5x>
References: <20241225020305.440008-1-wenliang202407@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241225020305.440008-1-wenliang202407@163.com>

On Wed, Dec 25, 2024 at 10:03:05AM +0800, Wenliang Yan wrote:
> From: Wenliang <wenliang202407@163.com>
> 
> Document the compatible string for the Silergy SQ52206, this device
> is a variant of the existing INA2xx devices and has the same device
> tree bindings.
> 
> Signed-off-by: Wenliang <wenliang202407@163.com>

Where is the rest of the patches? Why this is 3/3, not first, before the
users (assuming there are users)? If there are no users, then that's a
no...

> ---
>  Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
> index 05a9cb36cd82..f0b7758ab29f 100644
> --- a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
> @@ -20,6 +20,7 @@ description: |
>  properties:
>    compatible:
>      enum:
> +      - silergy,sq52206

So it is compatible or not? You said same bindings, but not compatible?

Best regards,
Krzysztof

