Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6242D192D75
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Aug 2024 12:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725021043; cv=none; b=s8XkW+80r/mUy+R7OXxDPgBPOGvpNCZiEo1HNVW5qtzqbCi2O7uZii2TZutT6NQ/K43Tf7faZiYPs3bxU+OKw8ab9D17eQxsOrkKkZUEJjXyPHeLDPvf1sQW1+ad8+3lr71eEvr4MSUUYJxPxzJ9XbGXF+++Trd4y5R0wA+6u4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725021043; c=relaxed/simple;
	bh=5LjYbwdNHv0zVWuJnHrLpVjFGZTruftU5C1esFGA5EQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p/mAYMxfCQxxYCzvuuQP5O9RTuoauUJp+zmog2mBZYD3KbQ4Ze8hs0zm+BX86Xd7pKoLfLEyNXFRB1HyrtDiaS6hrsgOUAjBCRTw8n2PMrDjynDvqXSp3NaAzhQu5eHgcy9eeokNxqMjxFpum7lHminhXulYiuYdZ8f0cGUl2GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wjqlkw7y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wjqlkw7y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44C2BC4CEC2;
	Fri, 30 Aug 2024 12:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725021042;
	bh=5LjYbwdNHv0zVWuJnHrLpVjFGZTruftU5C1esFGA5EQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wjqlkw7yFdwB90ynoMbVF6w0q8tGbP0dY/EB0x1pkWN9+lKJZtnF760cWr+uFMKKX
	 dN/pL+/MdeZ++twEr95HbJs8eRwSpfA4v5y4HO0tSIsH+aJVaUmnYsWFX7a/K2e6vA
	 Mf64+s1KoyPG+xIJs4ztLtvru+Kf8XezKTYeWwsliDOHm3vBpo59ehFFMBk7rHEx5M
	 4HERlf+XqDoDBiTjFcqVKWDdKEmjexhoXYxJR99+zpPeo+c3TpK5XgiWuzIAc94hty
	 7+UJS0W4aGnYq7GBtrX6oy6Y4KQMrvIX5qMQpHfSyl+Lyf5Q67+tn4ymAgJideBMlV
	 xcEch7lFlgmBw==
Date: Fri, 30 Aug 2024 20:30:39 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v2 13/14] hwmon: (ina2xx) Add support for current limits
Message-ID: <ZtG7b7X6GwMrUpTd@tzungbi-laptop>
References: <20240830010554.1462861-1-linux@roeck-us.net>
 <20240830010554.1462861-14-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830010554.1462861-14-linux@roeck-us.net>

On Thu, Aug 29, 2024 at 06:05:53PM -0700, Guenter Roeck wrote:
> While the chips supported by this driver do not directly support current
> limits, they do support setting shunt voltage limits. The shunt voltage
> divided by the shunt resistor value is the current. On top of that,
> calibration values are set such that in the shunt voltage register and
> the current register report the same values. That means we can report and
> configure current limits based on shunt voltage limits, and we can do so
> with much better accuracy than by setting shunt voltage limits.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
