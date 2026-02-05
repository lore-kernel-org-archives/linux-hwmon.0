Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAB53382F7;
	Thu,  5 Feb 2026 13:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770299193; cv=none; b=AWuq81Bq+wOQ19m0kcfMPre9JxvcwYUKIhhLOd3EwtMwDvUicg1Hktfo2Sn8xHgI/+R4pLaqD9nSp7Hb+xNKyl6sfzxn/PL/2bYU5DhAJ2ygdLCRQ8ZtcEcBRdCwWZbtWrC4G++v31vVfiHvrIO9SVHyVp7JzRMZd2/G76s9DfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770299193; c=relaxed/simple;
	bh=bIlAdWh0KNLb68de3Ic1dS8a+M6Reb6UrKSML4j63hE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T7VShQp1Ly4cbxaOO+gH9zIbPkj/6bYN1+FmfHHGvXarkHGrBmtjf1h25Jy00KwGh/r4as8UUooov4hO2VEqzjMf8Cd52YhBxGKzCJMthdE3yBtGgG35fWHRUzidsCbk88Mgs2vTDtKaEbkXQ+v0lYCidBBt+0J1Pc36qQMRyww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V6IQrf4R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V6IQrf4R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F002EC4CEF7;
	Thu,  5 Feb 2026 13:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770299192;
	bh=bIlAdWh0KNLb68de3Ic1dS8a+M6Reb6UrKSML4j63hE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V6IQrf4RR+ZbfwRAsWMtDy7kx2wAlbYiFAjVAd0CErjLFrkVNR79aoynyg7MMAXsp
	 2+0wOWZOq2riqS0T7l6YYwAWDAdWAoSJB0OPzYeE0XjUzxuBj8Qb4TPU6tVlDY/JQS
	 WYG9hFKMhxcutZwz6tcKsVpGlFPQ4ZVyyGOuON7V2hteDb66/fdQmLYWFFWjnk8mtW
	 G57UFuQNOBuTDxpfRFOpcs2cuJ2dcIN1IA3QTEMepkV0vrl54N3hUT0llFzB9QLNii
	 4MgUyaXXTZxw6WccXMOD4kAnV6yvHqZV0pRUqwWfpvY5RWGunnROihp+SqVD85shC/
	 PhyFCKBzWh/sQ==
Date: Thu, 5 Feb 2026 14:46:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Carl Lee <carl.lee@amd.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Charles Hsu <ythsu0511@gmail.com>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, peter.shen@amd.com, colin.huang2@amd.com
Subject: Re: [PATCH v2 1/3] dt-bindings: hwmon: pmbus: mpq8785: add MPQ8786
 support
Message-ID: <20260205-cordial-warping-pronghorn-aeebe7@quoll>
References: <20260205-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v2-0-3744cd9b2850@amd.com>
 <20260205-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v2-1-3744cd9b2850@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260205-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v2-1-3744cd9b2850@amd.com>

On Thu, Feb 05, 2026 at 06:01:37PM +0800, Carl Lee wrote:
> Add device type support for MPQ8786
> 
> Signed-off-by: Carl Lee <carl.lee@amd.com>
> ---
>  Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> index 90970a0433e9..aec7397a29f9 100644
> --- a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> @@ -19,6 +19,7 @@ properties:
>        - mps,mpm3695-25
>        - mps,mpm82504
>        - mps,mpq8785
> +      - mps,mpq8786

Your driver code says they are the same, so compatible. Express it with
fallback or provide real rationale in commit msg.

Best regards,
Krzysztof

