Received: from 18.mo584.mail-out.ovh.net (18.mo584.mail-out.ovh.net [188.165.54.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C15013AD2F
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Apr 2024 22:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.54.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713307589; cv=none; b=XoMQdu3O7UtCRvqKgafqC50Hl2fJsOwjQl4E+N8sUgt5cQkl1YOovVvzWvMG8oSofQkR2pX7g1aCwukKGDepfJz8k6UwQoRm5x4Ast6NRpSl0nHXbJhJXf92EeFMct91nZx0PGFxn2UA0q1BQntvIv0OGDSHMFtZpTSAloRJVXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713307589; c=relaxed/simple;
	bh=qjlfiV/5rAQPv2xdoYdnGIazQZt8/f6D7rMpTZzMwS8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TakUARfQHE/+DsgYcxgqiXqI8GEZOq7sIJiYLod1C9NgmqpUPCYxKA917YFNZziUe+qPVEkIXuxzCvoy3lOsVm7pRbs8iB3Ubz60v64WlqA+5GwEDXC6tMni9TTMlz6/d3xhDPz4PESjrH3sMOwItudB1NlDzLzByQT9u3TceHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=188.165.54.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director2.ghost.mail-out.ovh.net (unknown [10.108.17.88])
	by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4VJzfg5fSKz1Ktx
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Apr 2024 22:46:19 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-tb8qh (unknown [10.111.174.115])
	by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id E3DB21FD1A;
	Tue, 16 Apr 2024 22:46:17 +0000 (UTC)
Received: from etezian.org ([37.59.142.98])
	by ghost-submission-6684bf9d7b-tb8qh with ESMTPSA
	id ySEiL7n/HmbEKwAAaA9+Iw
	(envelope-from <andi@etezian.org>); Tue, 16 Apr 2024 22:46:17 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-98R00216c54067-ef62-4a2b-ace9-7a315bec58b8,
                    38C292890E232DD6F9946AE994780F0893807590) smtp.auth=andi@etezian.org
X-OVh-ClientIp:89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: Jean Delvare <jdelvare@suse.com>, 
 Peter Korsgaard <peter.korsgaard@barco.com>, Peter Rosin <peda@axentia.se>, 
 Guenter Roeck <linux@roeck-us.net>, Wolfram Sang <wsa@kernel.org>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <90a0786f-136b-4097-9def-8d52e9e5d3cc@gmail.com>
References: <90a0786f-136b-4097-9def-8d52e9e5d3cc@gmail.com>
Subject: Re: (subset) [PATCH 0/4] i2c: Remove I2C_CLASS_SPD
Message-Id: <171330757627.1978363.4012133892929034393.b4-ty@kernel.org>
Date: Wed, 17 Apr 2024 00:46:16 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Ovh-Tracer-Id: 18427322300675852919
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrudejjedgudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpeffteehudffvdfhudfgffdugfejjeduheehgeefgeeuhfeiuefghffgueffvdfgfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdekledrvddujedruddtledrudeiledpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhhfihmohhnsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkeegpdhmohguvgepshhmthhpohhuth

Hi

On Mon, 15 Apr 2024 22:47:04 +0200, Heiner Kallweit wrote:
> Only remaining client driver supporting I2C_CLASS_SPD is jc42. This
> type of thermal sensor can be found on several DDR3/DDR4 modules.
> i2c_register_spd() instantiates also such thermal sensor i2c devices.
> Since 71b494e043d2 ("i2c: i801: Call i2c_register_spd for muxed child
> segments") i2c_register_spd() is called also for the remaining use case,
> systems with muxed SMBUS segments for SPD EEPROMs. i801 was the last
> bus driver supporting I2C_CLASS_SPD.
> Therefore I2C_CLASS_SPD class-based instantiation isn't needed any longer,
> and we can remove it completely.
> 
> [...]

Applied to i2c/i2c-host on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[1/4] i2c: i801: Remove usage of I2C_CLASS_SPD
      commit: 8bae811210b77e2cd1b62d9fb20d2e6126103135
[2/4] i2c: mux: gpio: remove support for class-based device instantiation
      commit: 1dfb192a687fded0f5e92518024baa673c297885
[4/4] i2c: Remove I2C_CLASS_SPD
      commit: f7ece6320f6f028873649b9aa836c5bc5abf2cb3

