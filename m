Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BC7397E80;
	Fri, 13 Mar 2026 13:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773408398; cv=none; b=k4My15cj7RSnwULdoTdSm5iu6OS+/d2CGz/ijby6j7SvBJ75xZwwpWIVz+X/dB/+RA56MRAhcjd8FJjXRaXj9RsIIcUPZxhuNnMAJ7y+mO2LyxfltVVrqE/Dh3Zqtp2DpQ4tT4WKsjWBdI3SXlYZat87/cU1SosE2+ABjanHIlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773408398; c=relaxed/simple;
	bh=TfwBSJ1ndv9sSZs/1Er3VMx1HzbHJZEr6HcXE146zxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TnGJCdWOd2BKpQCnBFyjj2FULdaNTlNeMhzbCcpRWRC8DcEhx3IyvzDQa9Nb9iL3ErMkyKABzw63R1pOIhVRU+p6IdOZjd1xtRhB7nPQBlCtC6n8z7i69EMzwAJ8OXT//RGIALTPTPwWY5QyWLboTsmHrMEUCdV9j1lZf7lQZBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nhYKU1S1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nhYKU1S1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F2B6C4AF53;
	Fri, 13 Mar 2026 13:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773408398;
	bh=TfwBSJ1ndv9sSZs/1Er3VMx1HzbHJZEr6HcXE146zxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nhYKU1S1Kl/jELU8gcsy8x6I4kx2K5utcLS5lEhphUfwQlgG4dOf2X2ly9Fj8uuXM
	 q3jZFxgEVx0hWeH4PswxojW6KXpQi6AkkTFCi2eq3A8rd8h+HsCnBbkgwuqZj4P/hI
	 nUULfVQTgoijapSkGrZkPe5FnkkzWWQ8b2+qiAnb2XgjoZI108JpM3EnE5IGQ3YtwX
	 Be46wEN8MO+CJA90ZZ2KgCmc0Txb5jU42AT6fbIU2nw44FX7G/pZ8JQcExAdCao8nb
	 6L7prQ7Uz4XUSmAdWTHkVxrWQoqgtEO7eyCrTwWY7YvGFB1iw5L+WF3pDk8Gca9qL5
	 jjtROUEUb2skQ==
Date: Fri, 13 Mar 2026 14:26:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: lm75: Add label property
Message-ID: <20260313-enthusiastic-defiant-mastiff-bfe8d5@quoll>
References: <20260311105809.107357-1-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260311105809.107357-1-flaviu.nistor@gmail.com>

On Wed, Mar 11, 2026 at 12:58:07PM +0200, Flaviu Nistor wrote:
> Add support for an optional label property similar to other hwmon devices.

I do not see any support being added here.

Subject is not accurate either. You did not add the label property.

Best regards,
Krzysztof

