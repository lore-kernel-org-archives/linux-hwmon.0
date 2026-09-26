Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A87A371867
	for <linux-hwmon@vger.kernel.org>; Sat, 26 Sep 2026 03:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790393389; cv=none; b=mtNrtBMGqJ0+PfdBw1uwyIZzai8ciF9Ci330XaA6Zr2Fs6YeOKK5tKPqLDmc2sS9jeE1uy8Cc858Kowi6t7zQDz86RRVSad0rBqIM6Ze4kC//aD0elrDGjURi+iiWZE9Il5ozF9RW2YCX+Ie/zEz+wMPuJtceruHaPm9vyGOdiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790393389; c=relaxed/simple;
	bh=h9PxQncYBLh3youqxgEia4ZTQ8uVglHXzoWmBgb9eiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k8OSubk++A4k/kDyq9NJP31XB4WHpqIO0gzKzFfO8HXd/4IyDL4NxDOMJuyHgWa2b1YpChT6o1yPU7xTEXJlkg8Kt/lkbqFKBBoIg6phHQZ+D+qMVx4aAq4I0pZGfWGOoTD/qbpGKHuIuRvpg9NO9IOyYENP9OYrxUJmTwjjckk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jEvOuKUo; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jEvOuKUo"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db1ca06a25so6636425ad.2
        for <linux-hwmon@vger.kernel.org>; Fri, 25 Sep 2026 20:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790393382; x=1790998182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1b7Xj/vB3OGygIglTW5p4IiMWkGrQYonjQ+99wVq5Rg=;
        b=jEvOuKUo2XLi2xxmmQhs29NlRRK5d5bdlLIodxW99rypmn5WhWMaVIxzDRw7l5gJ2e
         pl9CX0jtau5tn3hlThMw6AqgCJw0xKLJi3Tw0fgLfy0oIsDuZMsh/NGqgiyDiq2S5A8/
         RpnyQTT4sC8DzCICbhlXXEenoTlkZzY0Pwt1v0owjecVRAw5Tyht8UC1HV2O9SwMVwnv
         UAyXnaoKgoT/6oPmHTMPGmEmONkPGjpN2gGc9mKJqQwTe0JTD0p1i+okLr35/35aq89e
         UIjzfRbL7oZ84SpktFfLwmM2+8xDi3qTq9dHABQiE07tNNfI58Y3Zq85QkgRjPB1t/pg
         CJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790393382; x=1790998182;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1b7Xj/vB3OGygIglTW5p4IiMWkGrQYonjQ+99wVq5Rg=;
        b=FO9GnHfJ+kHHWxaCh2F4rin8wMqQUItICyte6exXMZdq7zlX1tDQfh/0qqq/eVr1SX
         MYIBNdiFfrJaAFEA9IFXX7wvghNgaixCkMYpuXmXZc0WHAKaDCk2N9+vkQLUeMWPxnPs
         fpsfqikU0sl1k+2a0MHvWpuIWCOGQM1bdOxHoztb59W+hw2EyIauq2LXx1gFza7yn7P1
         sZ7nqycJCQU0bqh9oZpjzJB81qlFlnXCc0sx3sQMHa9h84XlJX5i7+FL4fTbL8rNFENj
         Husk3hAOSOQyGYgaJSnL6+zALY9ex6NM90nUQmqbzWs6pEUzJ5pzGhrIEGWl6PmHmjk4
         MIag==
X-Forwarded-Encrypted: i=1; AKwUvBwLi4xbe8Pcuye3qvbpqH8n1/bjqcb39HHL9x8Y4ecK97LZNzIIWJ/+a7Vd62AFBe1LN+fqBZOij5NDpw==@vger.kernel.org
X-Gm-Message-State: AFuF++kDe016p8QB0gexxW2hrTK4jJxLZwKKxmgVCQ6W+9MXUct3gyTV
	CykIz8LX8tiCCKaIcRggkXWUeeHa8PJGFgugKVoieWuFz/4sdwFt+kpO
X-Gm-Gg: AYBFou1klzjJLoXerZTgbCqEhgSRxO/otkTdCg3JnYyf7ebE7RlExlRo8rtf/WLSxLX
	oDwgtYeKPxQ1fBZPJdn54YlfGkgg9GHvwRYoxk8mGGB4saR6I0VYIC3k6F6sR8fxn3H/29wP7nH
	qVXv9bFZhkgRYev7lUqaX8kzyvUaLEW+ojzWfapfZKu50rjM5nQXfDf4ilcuwLyIGc2ogPlAafM
	w/aJNJAoOD7QT5b4kD6jkCzDRWuR7EX5g6d7Ird88ZN/X1oHkR00T5cqiog636MG3AgTtAIulVp
	tTuhhNi9Lw5xzov5P18Ufx3dhQRQofZZopWSuSebfP3gle9anmO9yg7nNduqKvq0dXKLA6i9DLK
	/voGBm3lOVY8BWKKLeqS00gVdrOkqByBAVnhk7yRbtWW2qxhpx0Ei79t86iqZmxUrJJhyCaHW36
	Xj/Yq64oBsnFEUwJo7nc/jtMLusU39GNVQCqIfplzQuiOiIFaTIkfkPXD4aDCO5GiziZqzBjtSN
	HSFFvS+gPRg
X-Received: by 2002:a17:903:17ce:b0:2dd:8b0f:70ba with SMTP id d9443c01a7336-2df7e267763mr60112075ad.7.1790393382425;
        Fri, 25 Sep 2026 20:29:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913fede2sm18554725ad.33.2026.09.25.20.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 20:29:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 25 Sep 2026 20:29:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: ASHISH YADAV <ashishyadav78@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: Re: [PATCH 2/2] hwmon:(pmbus/xdpe1a2g7b) Add support for xdpe1a2g7c
 controller
Message-ID: <46a43ee9-7d2b-45f6-9751-9436fd69f7ff@roeck-us.net>
References: <20260921065702.93196-1-Ashish.Yadav@infineon.com>
 <20260921065702.93196-3-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921065702.93196-3-Ashish.Yadav@infineon.com>

On Mon, Sep 21, 2026 at 12:27:02PM +0530, ASHISH YADAV wrote:
> From: Ashish Yadav <ashish.yadav@infineon.com>
> 
> Extend xdpe1a2g7b driver to support xdpe1a2g7c model.
> 
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>

Applied.

Thanks,
Guenter
