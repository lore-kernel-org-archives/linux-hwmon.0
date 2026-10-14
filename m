Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811FF47140F;
	Wed, 14 Oct 2026 20:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792008654; cv=none; b=Yx6DjEFiJAJ/yW+/PftlqsNVb4Csilq0kkm5jX9ogOjb+1vmbRsHDEAkwxIkcXDlPgAN1GJvC9hiH3SVBSbbe0m3L8o8//5Ns59m4FgdEIGNy9uTrLK6nLI2WIHVZBirRlRjw6mnR4N2CT7t86JSdmyqVFthj5jGoX06wBz550M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792008654; c=relaxed/simple;
	bh=98ixtdieNVSxLdi3j8zLKklQttSuSaHvek0k00xCMJY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=blfb8xZLYJGinE9wA0yq1XW2O2hqzOqq3a2Wp9hd4HTmp6ci7uigFiP2v2ft0cQvwAF3K3nCQknEMRcsRxpCnKsiBlIZlGmiTKyyZgds2b6k5b1BEeVlD5fw++hL2SxxG197DNUxoqN4aJ0Bm4IEVKbtetAcQ8pxeIBO46roZUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQI676WI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQI676WI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F9C31F000C4;
	Wed, 14 Oct 2026 20:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792008653;
	bh=BgEgQi7zMz79xeupwXBhijVhnT9szJ81zBDVyBsvSQg=;
	h=Date:From:To:Cc:Subject:Reply-To;
	b=UQI676WIjOWbQh8okbqBUrtWWcpPnrEo/MXH6IiFivwmnkeOKa97GOOQoGECvQcYd
	 1DSTLe2ZzfCDrz7QxImMJFBn6PupmL9HALnUB7EBjRp8880AIdORftPpIhj1PMk7JT
	 nZztub1hHGPK3PFkfzR6Rl3NKQ4mssy3aVC/FDIFwa8SEDZP98ouBRZ5/UKBJKfzW/
	 fDTbR5pdxBtH0Sd4/ssrFkrBrheldtHPJZKVO6jHZWaKpUbPHhfWcvFq/kwMvTjGr/
	 KKDwHj7JWMeRID07WDhNANkXR20Uh7hvLtd5UlAl54B0+O1sR18KQFEXgr5LZ17n9k
	 QaRca2cCLbbIQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id CA991CE0C87; Wed, 14 Oct 2026 13:10:52 -0700 (PDT)
Date: Wed, 14 Oct 2026 13:10:52 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: =?iso-8859-1?Q?Sebasti=E1n?= Peyrott <speyrott@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org
Subject: [BUG] clamp() low limit 0 greater than high limit points[1] - 1
Message-ID: <fda0e59f-20e1-4a94-a714-288940dcdd37@paulmck-laptop>
Reply-To: paulmck@kernel.org
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello!

Recent -next trees have failed allmodconfig builds with the following
build error:

drivers/hwmon/minisforum-um780xtx.c: In function ‘um780xtx_sys_point_temp_store’:
  HDRTEST usr/include/linux/hash_info.h
././include/linux/compiler_types.h:702:45: error: call to ‘__compiletime_assert_727’ declared with attribute error: clamp() low limit 0 greater than high limit points[1] - 1
  702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |                                             ^
././include/linux/compiler_types.h:683:25: note: in definition of macro ‘__compiletime_assert’
  683 |                         prefix ## suffix();                             \
      |                         ^~~~~~
././include/linux/compiler_types.h:702:9: note: in expansion of macro ‘_compiletime_assert’
  702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:40:37: note: in expansion of macro ‘compiletime_assert’
   40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
./include/linux/minmax.h:188:9: note: in expansion of macro ‘BUILD_BUG_ON_MSG’
  188 |         BUILD_BUG_ON_MSG(statically_true(ulo > uhi),                            \
      |         ^~~~~~~~~~~~~~~~
./include/linux/minmax.h:195:9: note: in expansion of macro ‘__clamp_once’
  195 |         __clamp_once(type, val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
      |         ^~~~~~~~~~~~
./include/linux/minmax.h:231:32: note: in expansion of macro ‘__careful_clamp’
  231 | #define clamp_val(val, lo, hi) __careful_clamp(typeof(val), val, lo, hi)
      |                                ^~~~~~~~~~~~~~~
drivers/hwmon/minisforum-um780xtx.c:203:25: note: in expansion of macro ‘clamp_val’
  203 |                 value = clamp_val(value, 0, points[1] - 1);
      |                         ^~~~~~~~~

I must confess to being unsure what fix would be appropriate when
points[1] is zero or negative.

Help?

							Thanx, Paul
