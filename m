Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:38519 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751356AbdFXP7O (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 24 Jun 2017 11:59:14 -0400
Subject: Re: [PATCH 2/2 v4] hwmon: (aspeed-pwm-tacho) Poll with short sleeps.
To: Patrick Venture <venture@google.com>, joel@jms.id.au
Cc: linux-hwmon@vger.kernel.org, emilyshaffer@google.com,
        peterh@google.com
References: <20170624033956.120552-1-venture@google.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <294d348c-92c0-bb29-95a8-fd659b02e9bd@roeck-us.net>
Date: Sat, 24 Jun 2017 08:59:12 -0700
MIME-Version: 1.0
In-Reply-To: <20170624033956.120552-1-venture@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 06/23/2017 08:39 PM, Patrick Venture wrote:
> The reference driver polled but mentioned it was possible to sleep
> for a computed period to know when it's ready to read.  However, polling
> with minimal sleeps is quick and works.  This also improves responsiveness
> from the driver.
> 
> Testing: tested on ast2400 on quanta-q71l
> 
> Signed-off-by: Patrick Venture <venture@google.com>

Applied.

Thanks,
Guenter
