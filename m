Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295B02F6925
	for <linux-hwmon@vger.kernel.org>; Tue,  9 Dec 2025 14:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765291570; cv=none; b=PSQ50Llh9wRnhdwY0XB4p74HjJdJM6MuhKXMqfzwf5g9A3mFjcqHmmpNoo9mpDGjZM0Dg+XTFJ8P/9GfkzPOAazJT3QHfCE2Bt4ea8KDAvWSDiRUC56NRE68ELQ64cQ6DsAEB24Cmp/gkDN+wF700ddrT0gDQtsy8SScdzV83Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765291570; c=relaxed/simple;
	bh=4fmZfYSUNdsaSTLHpM8yeyepmqTOQi5Ko0nHpOXwYuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cWT9JmWsnc7HiotIBuCsD601R8TSIayX87/l/9RcyJbcXP9P/iPu8Holfk5U9V9wBnvBGG4Eb57TkCDcndaOlgA0ACU3ij1PuXd3cBHNTRU7RWO/D2q5xlUaAhFMNKkIbEzGxmbzgyv14w02HK3gcmKoyqtHF6ppSRBuYRlAYI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BtyMn/T4; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BtyMn/T4"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b72bf7e703fso972683866b.2
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Dec 2025 06:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765291566; x=1765896366; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4fmZfYSUNdsaSTLHpM8yeyepmqTOQi5Ko0nHpOXwYuc=;
        b=BtyMn/T4Aw9KeqxSQvIu8krvp/m4mn3Plad2gMYfyrHDF3M0MobzDcRqmL+8VupfU1
         MzZplvNo5kyaxxolg5LDo3WIdyzWneU9ulL0Gc8uYICDZ0dyZ+6/XDof3IWbnmVrirhh
         AyI7dZ5UQZ8N+MbJhU/EKTb+bBB8vkX1H+b+X4xiJhWdh3LsCLchnMmnIYf0ZYun3c2T
         1EDtw3Nd6QEehE0TaVSA5wZl/ZmFGvSLHGQ7WnYypyvUDVYmfMWsyPBZCMVRXKb2fuiw
         vHPPgkpeWMqhbrkttf8mKhpAP6CL5grGLqXqxMn3sM5vfJiQu38Htj/IW9YCea7VWzf2
         iWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765291566; x=1765896366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4fmZfYSUNdsaSTLHpM8yeyepmqTOQi5Ko0nHpOXwYuc=;
        b=SKr38/THER58w8cnE2PLs7p+6PI+3Yccssju9h3fh+Db7/nTXz3/ODGF8TRCs0pleO
         ELfe+/n9rkc4/YZPYrVRB4e3VnmaPvkQi4FcMRDgWrAHGMOic4AuMQ/VFtQ0F5K/H6J0
         wjiF3rIz53yA7RHA2glyCgS/A87KqlHuvH+xHliBigiad+9QClrPh9V/dRar3gGPpjVe
         3keUBpu7Tqoeda1/Ku5D7bQYS52Ou+k6EIZY2y+ky3og5VUMEmfd/WvPlEK/cg6mhrki
         1/53+Cgyw98t2yYA/kZxJ99+wH+u0maQvBtTmZ5aVvSnXagCru5M8Jq9ZJeIIov1enwy
         dIeA==
X-Forwarded-Encrypted: i=1; AJvYcCV0djf9KYB/mKdbqf64hOrKYkW1oJ8MhYJ+mvAKnP746zOOTM3OeKrg4jqULV4OpHvNSZhcQxI8SQ1h9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyU7zT8BK6S8b14ah9sWdR1yAvYVLlBfnODOGB2EXWxmupoG0HU
	QcDgndIwalXlsL6mauIGtCipW0G87sxQAm+PnFcE4/NpJVu5bqsVPa/2NZcquGaUrX8eqI/MaDH
	2e0+obCZfIRF70383p9gUhwaL5Mn/9/U=
X-Gm-Gg: ASbGnctwE+voNdyJh8Lfyzm5lf6ot+bL60owRnncHqQP4tFKd0YxhaRv+1MZFyCF/n/
	d3bFkrLf7ED5tW9CPBkDLjNkNEzPjHt3vs1/5b5WTrbeiGYfitnOBZfhoZZD2Gb0hDb6S8QHSZ4
	BmBt5uDujoHFPILv5qp3IwwV4jCZi/ja0BtB01FczfUFsfDnzfyl6F+JYTCW5ghriVZcYBzgaB3
	gfbD8rKh01Gznll3OBbn2qZVI+N0mGXETJPpVeAazzA4HljIC0x0QMUR1teA4huhvOat7HEacMU
	BZm7HDrl1OBWh+kkNPdwWD7fltG0R4WcU+gi+hall8St5iVqD6vkROUqjMA0wwszw2g6CbU=
X-Google-Smtp-Source: AGHT+IGlXu3dCFc83X6xkCFhuuTuzxpgBAzwDgILyS6ZUDAbBGi1U97b1Qfz8jIne/sjhUc3CyUOVqmVWZN3jo3XIyM=
X-Received: by 2002:a17:907:d9e:b0:b73:845f:4432 with SMTP id
 a640c23a62f3a-b7a2455d577mr1325347966b.32.1765291566315; Tue, 09 Dec 2025
 06:46:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251209-iio-inkern-use-namespaced-exports-v2-0-9799a33c4b7f@bootlin.com>
 <20251209-iio-inkern-use-namespaced-exports-v2-1-9799a33c4b7f@bootlin.com>
In-Reply-To: <20251209-iio-inkern-use-namespaced-exports-v2-1-9799a33c4b7f@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 9 Dec 2025 16:45:29 +0200
X-Gm-Features: AQt7F2rGwi5_TocOmRGciLvaWe8Y7Fghi7KYuOXmk6PhKTOAwIFDPQlb6Jsx554
Message-ID: <CAHp75VcX_z6q879gmWcb76SeFHtqMvpZ=y9PwNn0=eVFb06wAw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] iio: dac: ds4424: drop unused include IIO consumer header
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Guenter Roeck <linux@roeck-us.net>, Peter Rosin <peda@axentia.se>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Mariel Tinaco <Mariel.Tinaco@analog.com>, 
	Kevin Tsai <ktsai@capellamicro.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Eugen Hristev <eugen.hristev@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hansg@kernel.org>, 
	Support Opensource <support.opensource@diasemi.com>, Paul Cercueil <paul@crapouillou.net>, 
	Iskren Chernev <me@iskren.info>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Matheus Castello <matheus@castello.eng.br>, 
	Saravanan Sekar <sravanhome@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Casey Connolly <casey.connolly@linaro.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Amit Kucheria <amitk@kernel.org>, 
	Thara Gopinath <thara.gopinath@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 9, 2025 at 10:26=E2=80=AFAM Romain Gantois
<romain.gantois@bootlin.com> wrote:
>
> To prepare for the introduction of namespaced exports for the IIO consume=
r
> API, remove this include directive which isn't actually used by the drive=
r.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
