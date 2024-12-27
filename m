Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E931876;
	Fri, 27 Dec 2024 08:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735289434; cv=none; b=oShRura9+fawNxG9jYKuR6rZTgQimQw6q4hQr9GAy5rKSX3sYX4zE0Fkkd4c87Ku7iisO7719trvwN7jNuYxOK5hrCHsqPyCKEhYEh5+t8Mccn32AbVsCNJGb1BWLNSEKABEnXkIYDzxRJJqHRWyXdWRq/yq/RC8yUJm/s7D/sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735289434; c=relaxed/simple;
	bh=J1SodRkQ5CDrlHwM5jbelDUEQA2XquKaw1oB+fDXDgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hH8f9TPQ0DIKnms19gplbZkEKBgesBtIuh+ZVDmC8KuvF7zMEiJ2D398artoaLbWIjOeF47LFIAUpDrX6Ivfa10UPRq4DDAvs2VTZUXYLchcIxdBQ8aV2qiQKlos5D9ftJsPrr2mfSnoLtvu+6btqwogNfL4JOQsj/ty4nvxOdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CIj2NTRn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CIj2NTRn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 909D3C4CED0;
	Fri, 27 Dec 2024 08:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735289434;
	bh=J1SodRkQ5CDrlHwM5jbelDUEQA2XquKaw1oB+fDXDgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CIj2NTRnqB4Qic/Af8EbU8qNSnH043B+nTfX9EAWQsUKofrlpF2woXtrBmjqWgREH
	 mFAfU/j5H1DQBTKsXoLHXxvyfQBW2a0o0CsgtpIL31P59vzXPY6QBIBfbho6HgJZXq
	 XN9nO57rvYGAG5zdeZtefHSbgamGBnSvNt/jQiELlmIppZYy8+UFBqQTJYM8VGyg/Z
	 jqEhA28MBODYnS6fAL89zWFMZYevg42UMalGnTFFcVDQjvKLQzjvu5Kasl96h9fTKO
	 lmNJVSMh04qD/eUNnorby8wmDHtVu+TgeObVXlDLLsTs4r7JDvj6S8Wvw45uGK/qB/
	 2pVRdcURQLJLg==
Date: Fri, 27 Dec 2024 09:50:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kent Libetario <Kent.Libetario@analog.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: add adi,max42500.yaml
Message-ID: <bsxt5jk7snbweg6ocnlizsmmvlts5rmmpxxwpqqn75kqtperoa@u4faqhvioqon>
References: <20241220012003.9568-1-Kent.Libetario@analog.com>
 <20241220012003.9568-2-Kent.Libetario@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241220012003.9568-2-Kent.Libetario@analog.com>

On Fri, Dec 20, 2024 at 09:20:02AM +0800, Kent Libetario wrote:
> Add documentation for devicetree bindings for MAX42500
> 
> Signed-off-by: Kent Libetario <Kent.Libetario@analog.com>

Why not adding it to trivial devices? Aren't you missing some
properties, like VDD, EN and RESET?

Best regards,
Krzysztof

