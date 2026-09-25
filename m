Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B32C49BD96;
	Fri, 25 Sep 2026 12:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790341139; cv=none; b=sTqdzsytIEhLcXcTUe1Lxk9olcGsE6uynvtvQLWsRljjwzO0VbRKjpSCHo8HeUA9VKpB5HLBNQnKqAKLuzDAoaZ3t0tzMKiioRfwm9L7+gc6k36U1lgnCjL9txb4x26a7IQLitBfK/jwGPltYDfpEqj8BvZSx5oq7P6AiO6vrUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790341139; c=relaxed/simple;
	bh=sdG56pnlwO6He+ORE+w8S9SzFNP9obQrFGdNs9rxhr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KdB2y409SDzPODF1aXWumfSoNswMiNBn85ZgR/ZGAwa9ses4GevClQdRQ1+S7SiZ5+fpvjje+GbmtXRWE6ubc+Ut4ns3aSx30I5wWDZmorOo2LxIWgq9Ut/yHEh9SoeM9uyIwtH6sVrCYKzJs1UyoDhlz614E0sBPs1QkMax1Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h6zsj9OE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h6zsj9OE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A71791F000FF;
	Fri, 25 Sep 2026 12:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790341137;
	bh=VPbMDpc33fX3PXJ/imbMzDyWx2hF7264T9KMK8JhkM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h6zsj9OE3EWjte5vM0OEPKnqrW4BapJb60dj4pjLrcrnWG5yW346DM/USpNDfsRBw
	 dysAPKKnRjfJoY4eiLQbkayGNTBsT9gkGdzrsNI+qTwzyOpTd5GOvl/OOnyyyVOGss
	 TEMiMgcHnxmAYDNO+AoWJ0EQ94ybjQ+qO6m36rer8WQgKjhPW5aMILbMfO1divzL1i
	 v2+Lj2ls+JuJDY3e2ILMCdIGyX4w3IsJUVugvcXCh0WcSrsUfJA3GedXp96pqZTtOk
	 +dsirEJlrvJ50ErnV7lglQ4g43xIoU3K4iaerIlFSRFGxNzB4cSpQGxEmFOGp2OY/f
	 /alqqGAbeDTlg==
Date: Fri, 25 Sep 2026 14:58:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: ASHISH YADAV <ashishyadav78@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: Re: [PATCH 1/2] dt-bindings: trivial-devices: Add support for
 XDPE1A2G7C
Message-ID: <20260925-rigorous-legendary-quetzal-e4cd7e@quoll>
References: <20260921065702.93196-1-Ashish.Yadav@infineon.com>
 <20260921065702.93196-2-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260921065702.93196-2-Ashish.Yadav@infineon.com>

On Mon, Sep 21, 2026 at 12:27:01PM +0530, ASHISH YADAV wrote:
> From: Ashish Yadav <ashish.yadav@infineon.com>
> 
> Add Infineon Digital Multi-phase XDPE1A2G7C Controller to trivial devices.
> 
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

