Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.4]:59739 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751162AbdJYGFL (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Oct 2017 02:05:11 -0400
Subject: Re: hwmon/amc6821: Use common error handling code in
 amc6821_init_client()
To: =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?= <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
References: <8cc80503-aa2b-bb5e-ab40-fa31b401b6a2@users.sourceforge.net>
 <20171024201812.GA5769@roeck-us.net>
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <482baa1b-ea2d-76db-3aee-719b6645156c@users.sourceforge.net>
Date: Wed, 25 Oct 2017 08:03:13 +0200
MIME-Version: 1.0
In-Reply-To: <20171024201812.GA5769@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

> Nack; I am not a friend of that much verboseness to start with,
> and I don't think the patch improves readability.

* Do you care to avoid code duplication for two error messages in this use case?

* How do you think about to return a single error code directly
  without using an intermediate variable?

Regards,
Markus
