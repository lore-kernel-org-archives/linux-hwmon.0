Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B4A134C6
	for <linux-hwmon@vger.kernel.org>; Sun, 14 Jul 2024 07:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720940825; cv=none; b=RsKXQjRn/Ji6LWbq4O7N7tGrkijM4HkcSj9HJBlLp5vkBk/Jb6Qdxl4kiVuePJL9ymlaCyBv3+/Q99nvZ8yPBnaXrI0uYBZsBfV6f0ZwWdSMzm9ReVP6sCuq4QDSWWDxgtu18vhlhuuI9WkTgLqpzEvCTOjeGqbqH7wxA2GIzdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720940825; c=relaxed/simple;
	bh=HCIxQzF/Rk33zSxR/M+WOIjxDaSRFh6pQwXpm7p1F3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jP43b2KREZhEIT39siUKCQs+ebAqW1ZeSr1h8hV80zDBhp6Lnw//jw5S6Cu6xB/HNn11DZMj8o+9WStkzKaZPXi1ihPK35KUPdeD7Lsl3HkmK1HnvOlzeV8VUOwO+QukgtLyNlbsGdL5oDVbiRdW/C3XkB9hUWIxtWttA5lOMJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HMDc9sir; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HMDc9sir"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CBF3C116B1;
	Sun, 14 Jul 2024 07:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720940824;
	bh=HCIxQzF/Rk33zSxR/M+WOIjxDaSRFh6pQwXpm7p1F3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HMDc9sirwsD7fOfQ5FqLXhd38EoACyfvhUKQyFtTaWJNX7dulvtVTHy0eF9D/6l7h
	 DyIjz7RKK2EvPYSEEJdu0lqWG7sCHMM8ybV2A83GAHUyK6IBUlcAMYeAZjzD0AO1ZO
	 VFWo2TlcCpMg8+2q5hjcKVFv1PkGwBVSaum7CbCl/8fj66ucTiMLhzEuJsyQHAXVh6
	 CfIbORugXp6wns4Bh3rJEKPcjE8U5je2GYIda9iqUbBOGplYgOVI3wUVK+1/IJxFP2
	 GNHs6mKNe9hAxi5lzmNbS5vUZ7MD2Jh4OxQLCqk/1X1zPUV5YvJOZDG57/N7cBIDFx
	 uXtBWq8zjgVGg==
Date: Sun, 14 Jul 2024 15:07:01 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (max6697) Fix underflow when writing limit
 attributes
Message-ID: <ZpN5FSnlNFm6wW2Y@tzungbi-laptop>
References: <20240713213402.1085599-1-linux@roeck-us.net>
 <20240713213402.1085599-2-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240713213402.1085599-2-linux@roeck-us.net>

On Sat, Jul 13, 2024 at 02:34:02PM -0700, Guenter Roeck wrote:
> Using DIV_ROUND_CLOSEST() on an unbound value can result in underflows.
> Indeed, module test scripts report:
> 
> temp1_max: Suspected underflow: [min=0, read 255000, written -9223372036854775808]
> temp1_crit: Suspected underflow: [min=0, read 255000, written -9223372036854775808]
> 
> Fix by introducing an extra set of clamping.
> 
> Fixes: 5372d2d71c46 ("hwmon: Driver for Maxim MAX6697 and compatibles")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
