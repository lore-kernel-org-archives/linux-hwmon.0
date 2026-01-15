Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B9D35C1B0;
	Thu, 15 Jan 2026 09:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768469814; cv=none; b=T9PXxFoH5vyyhoRhXtM6EBIDURRVroaWvyaQY2HSyzRjytouaKZX/ZVic2EPH+i6ozj1XP1HmoRLgO0XvYeCyMqtdP1O5SJSl+wWGYlhLzkO9MLVgI27I9uyQ3dWigWM0wURmOT/nzjyfn9VYauQNVWkDI7hSRXnK9v23ICiCh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768469814; c=relaxed/simple;
	bh=uFaUuD/A2haTyM9gG6LyPdl4Jk1qU4YC1nz2xl1ItKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KQ7XHZOAJq51xH2KauzmyBOfPQHZpC916lcd/1PYuClYrbwhF9ULM0hgnXrkbMlLkEtD7+gZKx8AfJTuDFFEjbp5xmaM83MQlDoL/32YJ9aSmPgT60tkjRSe6YnhdlHG7uCHz1p+eYEPK5s2t8lRZ9fbMHAoF22JAgPkmkk3NSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U45MNPYA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U45MNPYA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6AD1C16AAE;
	Thu, 15 Jan 2026 09:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768469814;
	bh=uFaUuD/A2haTyM9gG6LyPdl4Jk1qU4YC1nz2xl1ItKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U45MNPYAmrIkpWaQ5zdUPRZSQXz2IK8zUE1WDc92xpS4NWHArUZgE1/xqDO1CSKCX
	 uFXYidXvxYaNbx9pNflZ3nnsHV21TMNh4561zekUumtnkCwrim5tB8rU7VWIOMlDho
	 Dn6Vl6UZvLveGAxCSVcwwnw8hP3qttLNfssusHp2j71BSpRL0xRf9YFEBnouDe9UwE
	 KpHLIx/diEkKEXCVGkV1IGXI4iy2gK+2+V1byCvj6LkJwkWjTwY+aeavMgcqbgEjfm
	 J5o9URtoq38r77cSrGoPI3Hs8iEU1vExOkIu1bLMO/1Mm9kP5xbwyR7AuuLlEvIuac
	 l61FwJQ0yJIaA==
Date: Thu, 15 Jan 2026 10:36:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mayank Mahajan <mayankmahajan.x@nxp.com>
Cc: linux@roeck-us.net, corbet@lwn.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	priyanka.jain@nxp.com, vikash.bansal@nxp.com
Subject: Re: [PATCH v2 2/3] dt-bindings: hwmon: ti,tmp108: Add P3T1035,P3T2030
Message-ID: <20260115-glittering-umber-dolphin-05fc4f@quoll>
References: <20260115065757.35-1-mayankmahajan.x@nxp.com>
 <20260115065757.35-2-mayankmahajan.x@nxp.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260115065757.35-2-mayankmahajan.x@nxp.com>

On Thu, Jan 15, 2026 at 12:27:56PM +0530, Mayank Mahajan wrote:
>  properties:
>    compatible:
>      enum:
> +      - nxp,p3t1035
>        - nxp,p3t1085
> +      - nxp,p3t2030

Your driver code suggests these are compatible, so express
compatibility (see talks, example-schema, writing bindings).

Best regards,
Krzysztof

