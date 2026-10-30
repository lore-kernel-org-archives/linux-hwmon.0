Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793374723;
	b=2gu4G2y1In22fA1FPZrEC4z3WiIYuKt4SSIToiYxqx7U8EZktM4rPikIOAOAK833UF6o
	 dK0ofIDsVT1BgCTPoKMRfBth2aKVyYZVcJhOBsGHJvA/4Njo/0a7jPDqs8BWgeOM/2JbV
	 THb6vm7VbOCN2qHWP5saMpfam5kf6Is0mo8LmFzJ4F7bkJrcqTGfezkJy4wdKPu9rG0QC
	 IXjBXjlPfMshanbLR9x0FuJ4HRm7WvqY/3lL7kdGvj9vQnIKob7bg8k6R8jA5lD2mdrwT
	 5jKicbIQhOXscaiuexR4lQcsYupXTh4GUJLE0Ks909+chD04NvQ5k0UakPctaKmYq7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793374723;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=uEkdquko9VR4gRZhJYW+RWvIiAuc7lgxpha8X3M0roc=;
	b=zw4LkTbwX1pjvFKd8UHiRg5vTGNa1FAV0tfoA/5KbsgBzklk5JXHAu9WEhMFcyEjRWgY
	 GhKGoBjqBo8Di3Yd+VRgb7c5ZuzD/4J1gfSU6whVFxLJepWPHyUM8QapT4Z/C9eONMkea
	 q2JWAf4PqCLJn2D8swR7QB2pjCc1/grSSlGGA0gnUcsk5krkeEAQ49VMsseobAExSco1u
	 BiJ9YUe97GDd1KYbIt6lK1RRMVwiF+C3Z0mYqDhfLh0Q+EE8/iz9jy3qNhZTezzcOgW7c
	 0H3aO7kyzNArQYLrfB+OgsZ+mom0tOR7Pzigd7G8RbHy5aR5mJ9JquGeXQ1/L6XuD7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UQTAu7XD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05206606A31A;
	Fri, 30 Oct 2026 15:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UQTAu7XD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BBC61F000C1;
	Fri, 30 Oct 2026 15:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793374722;
	bh=uEkdquko9VR4gRZhJYW+RWvIiAuc7lgxpha8X3M0roc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UQTAu7XDwiexZUovqY842fH+4N6aw5pL0Xe5ubdGhxbFLYsR18H7uvEOJZ/RCxXC3
	 ITRSlklkZIVUaOp5s+rF5lbb4y+SbmCTs2wnmg/Cg3XZ31zI9DuTq2pCn9lwVpx2o2
	 Lv1Jb/BgwpWKSDLNAKcVyhaPlBUS8EZzMwNY3/JCR083DDhniQyeaKugadbKR83UZz
	 d4V8khHCDck4p43mYLRcyV3iVFkIVoPAavAedeGvu0Ui51x7y1h8l2wCDWaNQFWhBO
	 3+zD07/HLClTnjIsm4w9egQphEgdjOlGttSDnKamoJBVLZiLaecptRzdTkaBgJPvk0
	 1fkM09l/K4ZmQ==
Date: Fri, 30 Oct 2026 10:38:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Igor Velkov <iav@iav.lv>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-hwmon@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Guenter Roeck <linux@roeck-us.net>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pwm-fan: Reference the common
 fan schema
Message-ID: <179337471871.91953.13659250524662558962.robh@kernel.org>
References: <20261018-helios64-fan-label-v1-0-69a3f96d4efa@iav.lv>
 <20261018-helios64-fan-label-v1-1-69a3f96d4efa@iav.lv>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018-helios64-fan-label-v1-1-69a3f96d4efa@iav.lv>


On Sun, 18 Oct 2026 07:54:59 +0300, Igor Velkov wrote:
> pwm-fan predates fan-common.yaml and repeats several of its properties.
> Reference the common schema, drop the duplicated properties and keep
> only the constraints specific to PWM fans.
> 
> This also allows label, which the hwmon core exposes as the label
> attribute.
> 
> Link: https://lore.kernel.org/r/20250106173805.GA501301-robh@kernel.org
> Assisted-by: LLM
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
>  .../devicetree/bindings/hwmon/pwm-fan.yaml         | 22 +++++-----------------
>  1 file changed, 5 insertions(+), 17 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

