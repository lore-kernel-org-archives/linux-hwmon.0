Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B4C24818C;
	Wed, 15 Jan 2025 09:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736934127; cv=none; b=bcfPKWZ+zCEVjpvb6mBrPzytmKL+WSMcwGywds+RwZdBB2di+Vb0Y+k0WIl4aFMDf2CFEv8Xa/OR04IHynhB3uxsg2EgL02Td2vuCjUM7Ui2bsIL62scOdQ4XbfBNNuClgUZVsaBi0CIiwAiypXqKM8wTNBNefZsSIDjW4oh7a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736934127; c=relaxed/simple;
	bh=EGFVLQ4EwxQEzhjrZiSeHNH08Pdhj7mMZ5+RRyrl9x0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k9aR5sEzpr+VuInl/9c3dNI24g6vocj+Y7T/gHuViXwXEPytMaQu/oIfoAKiVewfFO1vJDZJ2SUhlZgvhwPvLAThUedT4qDABkPBK+UeUy1CFINihpNjiLqwKyeoaaDI1b5XDAUsxSpGB2giCv9I07UuFJs+yHPgMYBM7KhYsWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XbuFVfaz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XbuFVfaz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3E07C4CEE2;
	Wed, 15 Jan 2025 09:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736934127;
	bh=EGFVLQ4EwxQEzhjrZiSeHNH08Pdhj7mMZ5+RRyrl9x0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XbuFVfazFA5Omct37IdhINp758egl6fy1S3Jzo2Mniwo/l803AhPCgbRzsuQXrVBc
	 PVXy1NIxBnQHIX8okjOz/w/SWhjfKHJ7RDfT4DBrCePh6t+QC4yssq7Y50BWd/nxX4
	 LOkVSUvY1H+qfZ7D84ba4NFUrlbiIS7RnOyv8ew8svIyhpUxNi+x49zQYXgaVktMwD
	 rKTRESNa4r/PgfRqu3jfRckdOeOammW4B2LO9aniF/84+DYXfZ/oR7w7ViEkjgLQ9k
	 4E/L5DZAsseNg8wyajMdZJKPtm3CzExSlNJHpzYWbH0PKFl5QAQWBbM3lehR6BdH/O
	 p3GA+1kUtq6/g==
Date: Wed, 15 Jan 2025 10:42:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Leo Yang <leo.yang.sy0@gmail.com>
Cc: jdelvare@suse.com, linux@roeck-us.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Leo-Yang@quantatw.com, corbet@lwn.net, 
	Delphine_CC_Chiu@wiwynn.com, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: ti,ina2xx: Add INA233 device
Message-ID: <d5rqo6fryvx76sta3cvjm55i7khiezj7dlspyij3jwzefsrtqq@rf7fzrt4yyo6>
References: <20250115015519.950795-1-leo.yang.sy0@gmail.com>
 <20250115015519.950795-2-leo.yang.sy0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250115015519.950795-2-leo.yang.sy0@gmail.com>

On Wed, Jan 15, 2025 at 09:55:20AM +0800, Leo Yang wrote:
> @@ -75,12 +76,40 @@ properties:
>        the alert polarity to active-high.
>      $ref: /schemas/types.yaml#/definitions/flag
>  
> +  ti,current-lsb-microamp:
> +    description: |
> +      This value depends on the maximum current that can be expected to be
> +      measured by ina233 in your circuit, divide Maximum Expected Current
> +      by 2^15 and express it in microamps.

No, express here maximum expected current. Otherwise what is here?
Define the physical property, not the value used by your driver.

> +
> +      This value will be used to calculate the current/power coefficient for
> +      the pmbus and to calibrate the IC.
> +    minimum: 0x1

s/0x1/1/

maximum?
default?

> +
>  required:
>    - compatible
>    - reg

Best regards,
Krzysztof

