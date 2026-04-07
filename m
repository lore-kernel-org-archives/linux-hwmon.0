Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D2B38A71E;
	Tue,  7 Apr 2026 07:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775545237; cv=none; b=TPmQl1kbHwnwg0VUm/ubtWdUSjka9iUf118sbueG0akzLYyxmoGvSf6WSO5wf9ZKHo7uTlwRzejNZThqX8ro0UTNXshUdA8nip+z4sJ3SUB23fsTg+RV8aSLwVy4d7sOWjOW2OGss8FX81HxhyKAHjlqKGgiLB50oI6MC3DM9sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775545237; c=relaxed/simple;
	bh=KC++AGYaCPtqG8OBRYariCPXzGcrTMUsx7ei4Bja4QQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KYuINtAvkjHRgRN4tr69i2+g8dc13AQwTfbQdUAohKVYl4664Ov5cMRgsTgnBZfd6ubkiNWnOSk6kLghUjO0tTWj/5GPWESs+ODsPk8PhreEDhYphZEUqV0NeJnUpW2cSbc9f/ghpmC/a9SSo+p1OFaM0w2PFLEMD4pkcD4weX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ID+ItTp7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ID+ItTp7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0586C2BC9E;
	Tue,  7 Apr 2026 07:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775545237;
	bh=KC++AGYaCPtqG8OBRYariCPXzGcrTMUsx7ei4Bja4QQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ID+ItTp7caZBgfAvTzsBBhnu+06DZg8amfvbRzMgapVy7TeBPfTaFvCHtLpFAUgdL
	 eeuD/Xu1FrRMlPI+2Y1030XGlUuYiwfwaqLRnwH5/MRcYfUNAdCNSY3MklSX+iRraM
	 fAWrGvdBqkb9SkFe9TpW49HFMbQlMJO43AocZHd3WGebXzFBE8px7btC61C5vxHbHA
	 CK3fsSwQ3L9BckdTvbOsr6f8dvrTGU0W2tABUqAv+avJwYgzOF3J7XhD2rfu0+lcpb
	 8+lnHxcgCnCm9LUX/wQFq8HygHNV12Txti/e+VkoJPEQj9oMai/03ruRT0f+BYrq0Z
	 JDgkz2L6pGhbA==
Date: Tue, 7 Apr 2026 09:00:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: ASHISH YADAV <ashishyadav78@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon/pmbus: Add Infineon XDP720
Message-ID: <20260407-monumental-mastiff-of-sunshine-fb27ab@quoll>
References: <20260406101647.109667-1-Ashish.Yadav@infineon.com>
 <20260406101647.109667-2-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260406101647.109667-2-Ashish.Yadav@infineon.com>

On Mon, Apr 06, 2026 at 03:46:46PM +0530, ASHISH YADAV wrote:
> From: Ashish Yadav <ashish.yadav@infineon.com>
> 
> Add documentation for the device tree binding of the XDP720 eFuse.
> This patch introduces a YAML schema describing the required and optional

Redundant parts was supposed to go to /dev/null.

You already said this in the first sentence.

Also, there is no such thing as YAML schema.


> properties for the XDP720 eFuse device node. It includes details on the
> compatible string, register mapping,supply and rimon-micro-ohms(RIMON).

So nothing here is useful - nothing explains the hardware, so drop all
this and keep only first sentence. Or say something useful about
hardware.

> 
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
> ---

Best regards,
Krzysztof

