Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4613381704;
	Wed, 14 Jan 2026 09:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768382279; cv=none; b=ELp/QbSrV/xu2fgIn6mW2rAr2wHfCV6n0hz6ZTirxoLHud6tfSrSEWA4tz57m4t9q5GSrutW66J9f8hbEjxnyhGYmm0847KpcRQGwHOXEszt0P1pMCBVb9BG43d/wiZn/kSfUKt/JEHNjoV/IeK3VYi8CzF8NJtUxdvsR3KgW0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768382279; c=relaxed/simple;
	bh=q3smbNKdR4zPlrM/XP1iEFII6FvSGn1e7Ff4Q8W6PC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TVIEQ5D0gaCOrz9vMRT5R1Fo2jMNBxuuIcpFshiQhS9PGvcHLDmGIeke+bVx9V98mMmVu+bkaZDUmIoAIp/uNKMtSDCuLNMBxLH9xz4khNFbcGjGqcppGwFmEcENEmj2TO6g2oFx4t5NeyLsqFILpXVBcd3K81ohmuxbOukcjoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M1IRGAV6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M1IRGAV6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA884C4CEF7;
	Wed, 14 Jan 2026 09:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768382279;
	bh=q3smbNKdR4zPlrM/XP1iEFII6FvSGn1e7Ff4Q8W6PC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M1IRGAV6AQSZRrFXwLoSUeZ+n1aLC76hOG22BW09SUTkIeV4+i0f1wK71CTkiOPHQ
	 DBkfu8YR4DI6JeuA73zvWrIoIxvsaZGRKOqaCmrJy8ho+W3cjBZHXx4blyXeXwoJ3t
	 OLBlUkNlf+IXTPxtg1K1SiUQR5d+FOmBfoLjqCD+VQOsBJz4fBYC0zXzCxNR5A4VPb
	 yHR4y2XpZxMN/WmD1NFP6mnpLHz3/fhwZ3MiNtmNpmLJDFbtemLSXASzLFG4IHtuhC
	 PNCZdN5VIQ1guGd0NSrLyhGCDLv3HsbaTTt4ZtZtMDcLH07wMSlaRu6Z9J0gyXqE7L
	 zpbo4AVZWrHaA==
Date: Wed, 14 Jan 2026 10:17:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mayank Mahajan <mayankmahajan.x@nxp.com>
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, priyanka.jain@nxp.com, vikash.bansal@nxp.com
Subject: Re: [PATCH 2/3] dt-bindings: hwmon: ti,tmp108: Add P3T1035,P3T2030
Message-ID: <20260114-hot-khaki-chicken-1dddda@quoll>
References: <20260113085224.1176-1-mayankmahajan.x@nxp.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260113085224.1176-1-mayankmahajan.x@nxp.com>

On Tue, Jan 13, 2026 at 02:22:23PM +0530, Mayank Mahajan wrote:
> Document the NXP P3T1035 and P3T2030 compatibles in TMP108.
> 
> Signed-off-by: Mayank Mahajan <mayankmahajan.x@nxp.com>
> ---
>  .../devicetree/bindings/hwmon/ti,tmp108.yaml        | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 

Where is the rest of the patches? b4 got only this one.

Please use b4 to properly thread/send your submissions. It's really
basics so a pity we need to repeating the same feedback to NXP again and
again.


Best regards,
Krzysztof

