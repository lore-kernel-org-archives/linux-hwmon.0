Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-yw0-f193.google.com ([209.85.161.193]:35082 "EHLO
        mail-yw0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751410AbdFZNQK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 26 Jun 2017 09:16:10 -0400
Received: by mail-yw0-f193.google.com with SMTP id z21so54202ywz.2
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Jun 2017 06:16:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACPK8XckfG5bcv=ouTt=OH3UZx8GkfY8P-mBr4VQcPYmYdoG6w@mail.gmail.com>
References: <20170624033946.120501-1-venture@google.com> <d2b275f1-cbb2-5266-51e0-4c50aa9b8798@roeck-us.net>
 <CACPK8XckfG5bcv=ouTt=OH3UZx8GkfY8P-mBr4VQcPYmYdoG6w@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 26 Jun 2017 22:45:49 +0930
Message-ID: <CACPK8XfAtxJgC0OwnnKnz0D4j8mkhkZHWmpjxZ_PHokFFjX6Lw@mail.gmail.com>
Subject: Re: [PATCH 1/2 v3] hwmon: (aspeed-pwm-tacho) reduce fan_tach period
To: Guenter Roeck <linux@roeck-us.net>
Cc: Patrick Venture <venture@google.com>, linux-hwmon@vger.kernel.org,
        Emily Shaffer <emilyshaffer@google.com>,
        Peter Hanson <peterh@google.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Jun 26, 2017 at 10:38 PM, Joel Stanley <joel@jms.id.au> wrote:
> I also encourage his efforts as he has spent time looking at the
> hardware in detail.

And I see that there was a v4 that was merged. Thanks!

Joel
