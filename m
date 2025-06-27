Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DB01A2387;
	Fri, 27 Jun 2025 19:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751053357; cv=none; b=ZX/aQ1KbG4xVa/gnrvis8D52+GlG3WiO2bSNtYHJdCSzRJjxQDH+0UGZGwiOfuK8VhZQ2aAnGWzs6G39AKvbS2hx8CCsbaNe0rLDLDKA9lJTzmj/ur9UQABiZyONuX/7BRjgIjW59jNu8bis1MjE4Go1KLvvjIuKw3679nKEcrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751053357; c=relaxed/simple;
	bh=lmTk9KXNTbNGFlFfciFYPMGN+3/wagDGMx1wv4xaYZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KZ5VKSzpaAquPoRVpPLecA5BT78gV9HviLQo10TBCLNK5PP0EMgwFlovd8QS7rtpU0Z8FMTYYDYkVLJzuayOjtCrdC2ygz6dhwO+xzjM0H0ImvZ+eWroTVa5xjcZxssl409kEsRv5nsItcKR2tt8F3WD6j+aZVU9zYbb76dwVAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b+64KMUr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b+64KMUr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8BEBC4CEE3;
	Fri, 27 Jun 2025 19:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751053356;
	bh=lmTk9KXNTbNGFlFfciFYPMGN+3/wagDGMx1wv4xaYZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b+64KMUrj5eT0PK5ZtsI2L3cBh+b6lXt3c4ZQxc50a6FnqPo/fiba6uFj+ygV6dnQ
	 7NnAKqMqLHY3KC6NCrID1BnWByL2TwLzAL5q2FGWAEzmue/tshfNcxbRPetUACoQr4
	 o6/EJmawItPMXZ4vL37DPs0hKAFJPzoB1foV5nGPEA/TkqqZQPEIrZPQVQcsvR0Mwc
	 SbSKtu0IyrEhhY0vR5eTUyJxgfwohnr23XnJDD86aWxpC8u3obL+oee2Jbpdw9TB9A
	 kxpKGicPycO2nxCnznjZkCcA/rDxhVVFTkAtPBIntzaLvimWZjww6T3eu9toAZ89a8
	 r5tOueakSoeWg==
Date: Fri, 27 Jun 2025 14:42:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jean Delvare <jdelvare@suse.com>, Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
	Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: hwmon: adt7475: Allow and recommend
 #pwm-cells = <3>
Message-ID: <175105335463.4059732.7576772318723698918.robh@kernel.org>
References: <cover.1750361514.git.u.kleine-koenig@baylibre.com>
 <77895aec937b6217f513d3b12e7945f1707fd906.1750361514.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77895aec937b6217f513d3b12e7945f1707fd906.1750361514.git.u.kleine-koenig@baylibre.com>


On Thu, 19 Jun 2025 21:37:46 +0200, Uwe Kleine-König wrote:
> To make this binding match what is usally used for PWMs, deprecate 4
> cells and allow 3 instead.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
>  .../devicetree/bindings/hwmon/adt7475.yaml        | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

