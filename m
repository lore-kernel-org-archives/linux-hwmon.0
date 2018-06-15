Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:42194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753688AbeFOVms (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 15 Jun 2018 17:42:48 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <e1bf52a721005b2017434acc54ec5ddc152d6fe4.1528990947.git.mchehab+samsung@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-hwmon@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
        alsa-devel@alsa-project.org, linux-fsdevel@vger.kernel.org,
        linux-mediatek@lists.infradead.org
References: <cover.1528990947.git.mchehab+samsung@kernel.org>
 <e1bf52a721005b2017434acc54ec5ddc152d6fe4.1528990947.git.mchehab+samsung@kernel.org>
Message-ID: <152909896651.16708.13481357388390831455@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v3 16/27] docs: Fix more broken references
Date: Fri, 15 Jun 2018 14:42:46 -0700
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Quoting Mauro Carvalho Chehab (2018-06-14 09:09:01)
> As we move stuff around, some doc references are broken. Fix some of
> them via this script:
>         ./scripts/documentation-file-ref-check --fix
> =

> Manually checked that produced results are valid.
> =

> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  .../devicetree/bindings/clock/st/st,clkgen.txt |  8 ++++----
>  .../devicetree/bindings/clock/ti/gate.txt      |  2 +-
>  .../devicetree/bindings/clock/ti/interface.txt |  2 +-

Acked-by: Stephen Boyd <sboyd@kernel.org>

