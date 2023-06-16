require "dxruby"
Window.width = 680
Window.height = 550
screen = 0
#---時間関係---#
    count = 0
    start_time = 0
    end_time = 0
    processing_time = 0
#---スタート画面---#
    # hit&blow
        hit_and_blow_font = Font.new(100)
        hit_and_blow_x = 340 - hit_and_blow_font.get_width("hit&blow") / 2
        hit_and_blow_y = 70
    # play
        play_font = Font.new(50)
        play_x = 340 - play_font.get_width("play") / 2
        play_y = 270
    # how to play
        how_to_play_font = Font.new(50)
        how_to_play_x = 340 - how_to_play_font.get_width("how to play") / 2
        how_to_play_y = 370
        how_to_play_box_x = how_to_play_x - 10
        how_to_play_box_y = how_to_play_y - 10
        how_to_play_box_width = how_to_play_font.get_width("how to play") + 20
        how_to_play_box_height = how_to_play_font.size + 20
    # end
        end_font = Font.new(50)
        end_x = 340 - end_font.get_width("end") / 2
        end_y = 370
#「数字」の選択画面の表示
    # ---「4つの数字を決めてください(重複あり。)」を表示---#
        dec_font = Font.new(40)
    #「4つの数字を選択してください」のXとY
        dec_x_1 = 340 - dec_font.get_width("P1　4つの数字を選択してください") / 2
        dec_y_1 = 20
    #「重複なし」のXとY
        dec_x_2 = 340 - dec_font.get_width("※重複なし") / 2
        dec_y_2 = 80
    #自分の選択した数字が入る箱のxとy
        dec_box_x = [140,240,340,440,540]
        dex_box_y = [160,260]
    #各数字の箱のxとy数字とフォントの大きさ
        num_box_x = [40,140,240,340,440,540]
        num_box_y = 320
        num_font = Font.new(60)
        number = ["1","2","3","4","5","6","0"]
        #選択した数字のx座標
        dec_num_wid = [175,275,375,475]
        now_player_num = 0
    #各数字を代入する際に利用する
        #変数numberのインデックスを代入する配列
        dec_num_1 = [-1,-1,-1,-1]
        #dec_num_1のインデックスを0 ~ 4をにするためのコード
        dec_num_2 = 0
    #「決定」の表示のためのコード
        det_font = Font.new(40)
        det_x = 170 - det_font.get_width("決定") / 2
        det_y = 450 
        det_box_x = det_x - 15
        det_box_y = det_y - 15
        det_box_width = det_font.get_width("決定") + 20
        det_box_height = det_font.size + 30
    #「削除」の表示のためのコード
        del_font = Font.new(40)
        del_x = 510 - det_font.get_width("削除") / 2
        del_y = 450 
        del_box_x = del_x - 15
        del_box_y = del_y - 15
        del_box_width = del_font.get_width("削除") + 20
        del_box_height = del_font.size + 30
    #先行と後攻を決める
#---「先攻」「後攻」画面の表示---#
    #----「player1」の表示
    player_font = Font.new(50)
    player_1_x = 170 - player_font.get_width("player1") / 2 
    player_1_y = 150
    #----「player2」の表示
    player_2_x = 510 - player_font.get_width("player1") / 2 
    player_2_y = 150
    #----「先攻」「後攻」の表示
    fir_font = Font.new(50)
    fir_x = 170 - fir_font.get_width("先攻") / 2 
    bac_font = Font.new(50)
    bac_x = 510 - bac_font.get_width("後攻") / 2 
    fir_bac_x = [fir_x,bac_x]
    fir_bac_y = 300
    #先行と後攻を選択する際の表示
        fir_bac_1 = 0
        fir_bac_2 = 1
        fir_bac_3 = 2
    #先行と後攻を表示する場所を決める所
        fir_bac_num = 0
#---ゲーム画面の表示---#
    #各playerの四角形の縦辺のx座標
    height_block_x = [20,220,320,360,560,660]
    #「H」の表示
        h_x = [240,580]
    #plyayer1のHの値
        #表示のため「-1」にする
        p1_h = -1
        p1_h_box = []
    #plyayer2のHの値
        #表示のため「-1」にする
        p2_h = -1
        p2_h_box = []
    #「B」の表示
        b_x = [285,630]
    #plyayer1のBの値
        #表示のため「-1」にする
        p1_b = -1
        p1_b_box = []
    #plyayer2のBの値
        #表示のため「-1」にする
        p2_b = -1
        p2_b_box = []
    #「決定」・「削除」関係の値
        #「決定」・「削除」のx座標とy座標
        det_del_font = Font.new(30)
        det_del_x = 615 - det_del_font.get_width("決定") / 2 + 10
        det_del_y = [445,495]
        #「決定」・「削除」を囲む四角形のx座標とy座標
        det_del_box_x = det_del_x - 15
        det_del_box_y_1 = det_del_y[0] - 10
        det_del_box_y_2 = det_del_y[1] - 10
        det_del_box_y = [det_del_box_y_1, det_del_box_y_2]
        #「決定」・「削除」を囲む四角形の縦幅・横幅
        det_del_box_width = det_font.get_width("決定") + 10
        det_del_box_height = det_font.size + 10
    #選択した数字のy座標を表す
        answer_box_y = [55,105,155,205,255,305,355]
        play_1_answer_box_x = [33,83,133,183]
        play_2_answer_box_x = [373,423,473,523]
    #画面下に表示している数字のx座標と選択した数字を代入する変数
        cho_num_x = [10,100,190,280,370,460] 
    #「player1」と「player2」の選択した値を代入する配列
        play_1_box = []
        play_2_box = []
    #「player1」と「player2」の答えを代入する配列
        play_1_answer_box = []
        play_2_answer_box = []
    #「player1」と「player2」の答えを表示する値を挿入する配列
        play_1_showbox = []
        play_2_showbox = []
        answer_num_font = Font.new(45)
    #「H」「B」の計算をするために利用する変数
        blow_box = []
    #削除の際に利用する変数
        p1_del_num = 0
        p1_sum_del_num = 0
        p2_del_num = 0
        p2_sum_del_num = 0
    #リトライ
        re_num = 0
    # cpu_box = [rand(6)+1,rand(6)+1,rand(6)+1,rand(6)+1]

#ゲーム画面の四角形の縦辺を表示するための関数
def height_block(x)
    Window.draw_box_fill(x,50,x+5, 405, [255, 255, 255])
end 

#クリックした数字の値を返すための関数
def decide_number(input_x,num_box_x)
    x = 0
    for a in 0..(num_box_x.length-1)
        if (input_x >= num_box_x[a]) && (input_x <= num_box_x[a] + 80)
            input_x = x
            return input_x
        end
        x += 1
    end
end 

#各playerの「H」「B」の値を表示するための関数  
def show_H_B_num(h_x,b_x,y,number,h_box,b_box,font)
    if b_box.length == 1
        Window.draw_font(h_x,y[0],number[h_box[0]],font,color: C_BLACK)
        Window.draw_font(b_x,y[0],number[b_box[0]],font,color: C_BLACK)
    elsif b_box.length > 1
        for a in 0..(b_box.length-1)
            Window.draw_font(h_x,y[a],number[h_box[a]],font,color: C_BLACK)
            Window.draw_font(b_x,y[a],number[b_box[a]],font,color: C_BLACK)
        end
    end
end

#各plyaerの数字の表示
def show_num(x,y,number,showbox,font)
    #player1の数字の表示
    if showbox.length == 1
        Window.draw_font(x[0], y[0],number[showbox[0]],font,color: C_BLACK)
    elsif showbox.length >= 2 && showbox.length <= 4
        for a in 0..(showbox.length-1)
            Window.draw_font(x[a], y[0],number[showbox[a]],font,color: C_BLACK)
        end
    elsif showbox.length > 4
        in_x = 0
        in_y = 0
        for a in 0..(showbox.length-1)
            Window.draw_font(x[in_x],y[in_y],number[showbox[a]],font,color: C_BLACK)
            in_x += 1
            if (a + 1) % 4 == 0
                in_x = 0
                in_y += 1
            end
        end
    end
end

Window.loop do
    Window.draw_box_fill(0, 0, Window.width, Window.height, [17,17,136])
    #スタート画面の表示
    if screen == 0
        Window.draw_box_fill(0, 0, Window.width, Window.height, [17,17,136])
        #「hit&blow」を表示
        Window.draw_font(hit_and_blow_x, hit_and_blow_y, "hit&blow", hit_and_blow_font)
        # 「play」を表示
        Window.draw_box(how_to_play_box_x, play_y, how_to_play_box_x + how_to_play_box_width, play_y + how_to_play_box_height, [255, 255, 255])
        Window.draw_font(play_x, play_y + 5, "play", play_font)
         #「end」を表示
         Window.draw_box(how_to_play_box_x, how_to_play_box_y, how_to_play_box_x + how_to_play_box_width, how_to_play_box_y + how_to_play_box_height, [255, 255, 255])
         Window.draw_font(end_x, end_y, "End", end_font)
        #「play」を赤色にする
        if (Input.mouse_x >= how_to_play_box_x) && (Input.mouse_x <= how_to_play_box_x + how_to_play_box_width) && (Input.mouse_y >=play_y) && (Input.mouse_y <= play_y + how_to_play_box_height)
            Window.draw_font(play_x, play_y + 5, "play", play_font,color: C_RED)
            if (Input.mouse_push?(M_LBUTTON)) || (Input.mouse_push?(M_RBUTTON))
                screen = 1
            end
        end
        #「end」を赤色にする
        if (Input.mouse_x >= how_to_play_box_x) && (Input.mouse_x <= how_to_play_box_x + how_to_play_box_width) && (Input.mouse_y >=end_y) && (Input.mouse_y <= end_y + how_to_play_box_height)
            Window.draw_font(end_x, end_y, "End", end_font,color: C_RED)
            if (Input.mouse_push?(M_LBUTTON)) || (Input.mouse_push?(M_RBUTTON))
                break
            end
        end
    end #if screen == 0のend
    #---数字を決める際の画面の初期表示----#
    if screen == 1
        #時間関係のコード
        if count == 0
            start_time = Time.now
            count = 1
            # printf("screen = %d\n",screen)
        end
        end_time = Time.now
        processing_time = end_time - start_time 

        #文字・四角形の表示
            if now_player_num == 0
                Window.draw_font(dec_x_1,dec_y_1, "P1　4つの数字を選択してください", dec_font)
            elsif now_player_num == 1
                Window.draw_font(dec_x_1,dec_y_1, "P2　4つの数字を選択してください", dec_font)
            end
            Window.draw_font(dec_x_2,dec_y_2, "※重複なし", dec_font)
            Window.draw_font(det_x,det_y,"決定",det_font)
            Window.draw_box(det_box_x,det_box_y,det_x + det_box_width,det_box_y + det_box_height,[255, 255, 255])
            Window.draw_font(del_x,del_y, "削除", del_font)
            Window.draw_box(del_box_x,del_box_y,del_x + del_box_width,del_box_y + del_box_height,[255, 255, 255])
        #自分の決めた数字が入る箱の表示
            #y座標について
                Window.draw_box_fill(dec_box_x[0],dex_box_y[0],dec_box_x[4], dex_box_y[0]+1, [255, 255,255])
                Window.draw_box_fill(dec_box_x[0],dex_box_y[1],dec_box_x[4], dex_box_y[1]+1, [255, 255,255])
            #x座標について
            for a in 0..(dec_box_x.length-1)
                Window.draw_box_fill(dec_box_x[a],dex_box_y[0],dec_box_x[a]+1, dex_box_y[1], [255, 255, 255])
            end
        #数字の箱の表示
        for a in 0..(num_box_x.length-1)
            Window.draw_box_fill(num_box_x[a],num_box_y,num_box_x[a]+80,num_box_y+80,[255, 255, 255])
        end
        #数字の表示
        for a in 0..(number.length-2)
            Window.draw_font(num_box_x[a] + 25, num_box_y + 10,number[a],num_font,color: C_BLACK)
        end
        #数字の代入
        if processing_time >= 0.5 && dec_num_1[3] < 0 
            for a in 0..(number.length-2)
                if (Input.mouse_x >= num_box_x[a]) && (Input.mouse_x <= num_box_x[a] + 80) && (Input.mouse_y >= num_box_y) && (Input.mouse_y <= num_box_y + 80)
                    Window.draw_font(num_box_x[a] + 25, num_box_y + 10,number[a],num_font,color: C_RED)
                    if (Input.mouse_push?(M_LBUTTON)) || (Input.mouse_push?(M_RBUTTON))
                        input_x = Input.mouse_x
                        dec_num_1[dec_num_2] = decide_number(input_x,num_box_x)
                        #重複を防ぐためのコード
                        #1つ目と2つ目の数字の重複確認
                        if dec_num_2 == 1
                            if dec_num_1[dec_num_2] == dec_num_1[dec_num_2-1]
                                dec_num_1[dec_num_2] = -1
                                next
                            end    
                        # 選んでいる数字とその前の数字の重複確認
                        elsif dec_num_2 > 1
                            for a in 0..(dec_num_2-1)
                                if dec_num_1[dec_num_2] == dec_num_1[a]
                                    x_4 = 1
                                    break
                                end    
                            end
                            if x_4 == 1
                                x_4 = 0
                                dec_num_1[dec_num_2] = -1
                                next
                            end
                        end
                        #各数字を各playerの配列に挿入
                        if now_player_num == 0
                            play_1_box.push(dec_num_1[dec_num_2])
                            dec_num_2 += 1
                        elsif now_player_num == 1
                            play_2_box.push(dec_num_1[dec_num_2])
                            dec_num_2 += 1
                        end
                    end
                end
            end
        end
        #選択した数字を表示するためのfor分
        for a in 0..(dec_num_1.length-1)
            if dec_num_1[a] >= 0 
                Window.draw_font(dec_num_wid[a], dex_box_y[0]+20,number[dec_num_1[a]],num_font,color: C_BLACK)
            end
        end
        #文字を削除するためのコード
        if dec_num_2  > 0
            if (Input.mouse_x >= del_box_x) && (Input.mouse_x <= del_box_x + del_box_width) && (Input.mouse_y >= del_box_y) && (Input.mouse_y <= del_box_y + del_box_height)
                Window.draw_font(del_x,del_y, "削除", del_font,color: C_RED)
                if (Input.mouse_push?(M_LBUTTON)) || (Input.mouse_push?(M_RBUTTON))
                    dec_num_2 -= 1
                    if now_player_num == 0
                        play_1_box.delete_at(dec_num_2)
                    elsif now_player_num == 1
                        play_2_box.delete_at(dec_num_2)
                    end
                    dec_num_1[dec_num_2] = -1
                end
            end
        end
        #決定を押したときplayer2に変更するためのコード
        if dec_num_1[3] >= 0 
            Window.draw_box(det_box_x,det_box_y,det_x + det_box_width,det_box_y + det_box_height,[255, 212, 0])
            if (Input.mouse_x >= det_box_x) && (Input.mouse_x <= det_x + det_box_width) && (Input.mouse_y >= det_box_y) && (Input.mouse_y <= det_box_y + det_box_height)
                Window.draw_font(det_x,det_y,"決定",det_font,color: C_RED)
                if (Input.mouse_push?(M_LBUTTON)) || (Input.mouse_push?(M_RBUTTON))
                    if now_player_num == 1
                        screen = 2
                    end
                    dec_num_1 = [-1,-1,-1,-1]
                    dec_num_2 = 0
                    count = 0
                    now_player_num = 1
                end
            end
        end
    end     #if screen = 1 のend

    #先行と後攻を決める表示
    if screen == 2 
        #時間関係のコード
        if count == 0
            start_time = Time.now
            count = 1
            dec_num_1 = [-1,-1,-1,-1]
            dec_num_2 = 0
            now_player_num = fir_bac_num
            # printf("screen = %d\n",screen)
        end
        end_time = Time.now
        processing_time = end_time - start_time 

        # 中央線のを表示
        Window.draw_box_fill(339, 0, 341, 600, [255, 255, 255])

        #「player1」「player2」の表示
        if processing_time >= 0 && processing_time <= 5
            Window.draw_font(player_1_x,player_1_y,"Player1",player_font)
            Window.draw_font(player_2_x,player_2_y,"Player2",player_font)
            #先行と後攻を選択    
            if processing_time >= 1 && processing_time < 3
                Window.draw_font(fir_bac_x[fir_bac_1],fir_bac_y,"先攻",fir_font)
                Window.draw_font(fir_bac_x[fir_bac_2],fir_bac_y,"後攻",bac_font)
                fir_bac_3 = fir_bac_1
                fir_bac_1 = fir_bac_2
                fir_bac_2 = fir_bac_3
            #先行と後攻の表示
            elsif processing_time >=3 && processing_time <= 5
                if fir_bac_num == 0
                    Window.draw_font(fir_bac_x[0],fir_bac_y,"先攻",fir_font)
                    Window.draw_font(fir_bac_x[1],fir_bac_y,"後攻",bac_font)
                elsif fir_bac_num == 1
                    Window.draw_font(fir_bac_x[1],fir_bac_y,"先攻",fir_font)
                    Window.draw_font(fir_bac_x[0],fir_bac_y,"後攻",bac_font)
                end
            end
        #画面移動
        elsif processing_time > 5
            screen = 3
            count = 0
        end
    end #if screen == 2 のend

    #一人用のモード
    if screen == 3
        # 中央線の表示
            Window.draw_box_fill(339, 0, 341, 420, [255, 255, 255])
            Window.draw_box_fill(0, 420, 680, 422, [255, 255, 255])

        #各playerの四角形のy座標
        y = 50
        while y <= 400
            if  y < 400
                #四角形の中の灰色
                Window.draw_box_fill(20,y, 320, y+50, [199, 199, 199])
                Window.draw_box_fill(360,y,660, y+50, [199, 199, 199])
            end
            #四角形の周りの辺
                Window.draw_box_fill(20,y, 320, y+5, [255, 255, 255])
                Window.draw_box_fill(360,y,660, y+5, [255, 255, 255])
            y += 50
        end  

        #各playerの四角形の縦辺
        for x in 0..(height_block_x.length-1)
            height_block(height_block_x[x])
        end

        #「H」と「B」の表示(player1とplayer2の両方とも)
        for x in 0..1
            Window.draw_font(h_x[x], 10, "H",Font.new(40))
            Window.draw_font(b_x[x], 10, "B", Font.new(40))
        end

        #「P1」と「p2」の表示
        Window.draw_font(20, 10, "P1", Font.new(40))
        Window.draw_font(360, 10, "P2", Font.new(40))

        #「your」turnの表示(ターン変更機能)
        #playe1のターンの時
        if fir_bac_num == 0
            Window.draw_font(90, 18, "Your turn", Font.new(30),color: C_RED)
        #playe2のターンの時
        elsif fir_bac_num == 1
            Window.draw_font(435,18, "Your turn", Font.new(30),color: C_RED)
        end

        #「決定」・「削除」の表示
        Window.draw_font(det_del_x,det_del_y[0],"決定",Font.new(30))
        Window.draw_box(det_del_box_x, det_del_box_y[0] ,det_del_box_x + det_del_box_width, det_del_box_y[0] + det_del_box_height,[255, 255, 255])
        Window.draw_font(det_del_x,det_del_y[1], "削除",Font.new(30))
        Window.draw_box(det_del_box_x, det_del_box_y[1] ,det_del_box_x + det_del_box_width, det_del_box_y[1] + det_del_box_height,[255, 255, 255])

        #「削除」を押したときの機能
        if play_1_answer_box.length > 0 || play_2_answer_box.length > 0
            if (Input.mouse_x >= det_del_box_x) && (Input.mouse_x <= det_del_box_x + det_del_box_width) && (Input.mouse_y >= det_del_box_y[1]) && (Input.mouse_y <= det_del_box_y[1] + det_del_box_height)
                #「削除」の色の変換
                Window.draw_font(det_del_x,det_del_y[1], "削除",det_del_font,color: C_RED)
                #player_answer_boxの値の削除
                if (Input.mouse_push?(M_LBUTTON)) || (Input.mouse_push?(M_RBUTTON))
                    if fir_bac_num == 0
                        if p1_sum_del_num > p1_del_num &&  p1_del_num <= p1_sum_del_num + 4
                            dec_num_2 -= 1
                            p1_sum_del_num -= 1
                            play_1_answer_box.delete_at(dec_num_2)
                            play_1_showbox.delete_at(p1_del_num + dec_num_2)
                            dec_num_1[dec_num_2] = -1
                        end
                    elsif fir_bac_num == 1
                        if p2_sum_del_num > p2_del_num &&  p2_del_num <= p2_sum_del_num + 4
                            dec_num_2 -= 1
                            p2_sum_del_num -= 1
                            play_2_answer_box.delete_at(dec_num_2)
                            play_2_showbox.delete_at(p2_del_num + dec_num_2)
                            dec_num_1[dec_num_2] = -1
                        end
                    end 
                end
            end
        end #play_1_answer_box.length > 0 || play_2_answer_box.length > 0のend
        
        #画面下の数字の表示・選択
        for a in 0..(cho_num_x.length-1)
            #数字が入っている四角形(白)
                Window.draw_box_fill(cho_num_x[a], 445, cho_num_x[a] + 80, 525,[255, 255, 255])
            #1~6までの数字の表示
                Window.draw_font(cho_num_x[a] + 25 , 455 ,number[a],num_font,color: C_BLACK)
            #選択した数字をplayer_answer_boxに挿入する
            #全て数字が決まっているときに数字が入るのを防ぐ
            if (Input.mouse_x >= cho_num_x[a]) && (Input.mouse_x <= cho_num_x[a] + 80) && (Input.mouse_y >= 445) && (Input.mouse_y <= 525)
                #クリックしたときに選択した数字をplayer_answer_boxに挿入する
                if dec_num_1[3] < 0 
                    #1~6までの数字を赤色に
                    Window.draw_font(cho_num_x[a] + 25 , 455 ,number[a],num_font,color: C_RED)
                    if (Input.mouse_push?(M_LBUTTON)) || (Input.mouse_push?(M_RBUTTON))
                        input_x = Input.mouse_x
                        dec_num_1[dec_num_2] = decide_number(input_x,cho_num_x)

                        if dec_num_2 == 1
                            if dec_num_1[dec_num_2] == dec_num_1[dec_num_2-1]
                                dec_num_1[dec_num_2] = -1
                                next
                            end    
                        # 選んでいる数字とその前の数字の重複確認
                        elsif dec_num_2 > 1
                            for a in 0..(dec_num_2-1)
                                if dec_num_1[dec_num_2] == dec_num_1[a]
                                    x_4 = 1
                                    break
                                end    
                            end
                            if x_4 == 1
                                x_4 = 0
                                dec_num_1[dec_num_2] = -1
                                next
                            end
                        end
                        if fir_bac_num == 0
                            play_1_answer_box.push(dec_num_1[dec_num_2])
                            play_1_showbox.push(dec_num_1[dec_num_2])
                            p1_sum_del_num += 1
                        elsif fir_bac_num == 1
                            play_2_answer_box.push(dec_num_1[dec_num_2])
                            play_2_showbox.push(dec_num_1[dec_num_2])
                            p2_sum_del_num += 1
                        end
                        dec_num_2 += 1
                    end
                end
            end
        end
        #player1の数字の表示
            show_num(play_1_answer_box_x,answer_box_y,number,play_1_showbox,answer_num_font)
        #player2の数字の表示
            show_num(play_2_answer_box_x,answer_box_y,number,play_2_showbox,answer_num_font)
        #player1の「H」「B」の表示  
            show_H_B_num(h_x[0],b_x[0],answer_box_y,number,p1_h_box,p1_b_box,answer_num_font)
        #player2の「H」「B」の表示  
            show_H_B_num(h_x[1],b_x[1],answer_box_y,number,p2_h_box,p2_b_box,answer_num_font)
        #「H」と「B」を計算する    
        if dec_num_1[3] >= 0 
            Window.draw_box(det_del_box_x, det_del_box_y[0] ,det_del_box_x + det_del_box_width, det_del_box_y[0] + det_del_box_height,[255, 212, 0])
            if (Input.mouse_x >= det_del_box_x) && (Input.mouse_x <= det_del_box_x + det_del_box_width) && (Input.mouse_y >= det_del_box_y[0]) && (Input.mouse_y <= det_del_box_y[0] + det_del_box_height)
                Window.draw_font(det_del_x,det_del_y[0],"決定",det_del_font,color: C_RED)
                if  (Input.mouse_push?(M_LBUTTON)) || (Input.mouse_push?(M_RBUTTON))
                    if fir_bac_num == 0                        
                        for a in 0..(play_1_answer_box.length-1)
                            if play_1_answer_box[a] == play_2_box[a]
                                blow_box.push(a)
                                p1_b += 1
                            end
                        end
                        for a in 0..(play_1_answer_box.length-1)
                            for b in 0..(play_2_box.length-1)
                                if blow_box.length > 0
                                    for c in blow_box
                                        if  a == c || b == c
                                            d = 1
                                            break
                                        end
                                    end
                                    if d == 1
                                        d = 0
                                        next
                                    end
                                    if play_1_answer_box[a] == play_2_box[b]
                                        p1_h += 1
                                    end
                                else
                                    if play_1_answer_box[a] == play_2_box[b]
                                        p1_h += 1
                                    end
                                end
                            end
                        end
                        for a in 0..(play_1_answer_box.length-1)
                            play_1_answer_box.pop
                        end
                        p1_b_box.push(p1_b)
                        p1_h_box.push(p1_h)
                        p1_b = -1
                        p1_h = -1
                        fir_bac_num = 1                    
                        p1_del_num = p1_sum_del_num
                    elsif fir_bac_num == 1                        
                        for a in 0..(play_2_answer_box.length-1)
                            if play_2_answer_box[a] == play_1_box[a]
                                blow_box.push(a)
                                p2_b += 1
                            end
                        end
                        for a in 0..(play_2_answer_box.length-1)
                            for b in 0..(play_1_box.length-1)
                                if blow_box.length > 0
                                    for c in blow_box
                                        if  a == c || b == c
                                            d = 1
                                            break
                                        end
                                    end
                                    if d == 1
                                        d = 0
                                        next
                                    end
                                    if play_2_answer_box[a] == play_1_box[b]
                                        p2_h += 1
                                    end
                                else
                                    if play_2_answer_box[a] == play_1_box[b]
                                        p2_h += 1
                                    end
                                end
                            end
                        end
                        for a in 0..(play_2_answer_box.length-1)
                            play_2_answer_box.pop
                        end
                        p2_b_box.push(p2_b)
                        p2_h_box.push(p2_h)
                        p2_b = -1
                        p2_h = -1
                        fir_bac_num = 0                    
                        p2_del_num = p2_sum_del_num
                    end     #fir_bac_num == 1 の時のend とfir_bac_num == 0 の時のend 

                    dec_num_1 = [-1,-1,-1,-1]
                    dec_num_2 = 0
                    if blow_box.length == 1
                        blow_box.pop
                    elsif blow_box.length > 1
                        for a in 0..(blow_box.length-1)
                            blow_box.pop
                        end
                    end
                end
            end
        end

        if (p1_b_box.length > 0) && (p2_b_box.length > 0)
            if (p1_b_box.length == p2_b_box.length)
                if (p1_b_box[p1_b_box.length-1] == 3 && p2_b_box[p2_b_box.length-1] < 3)
                    screen = 5
                    count = 0
                elsif (p1_b_box[p1_b_box.length-1] < 3 && p2_b_box[p2_b_box.length-1] == 3)
                    screen = 5
                    count = 0
                elsif (p1_b_box[p1_b_box.length-1] == 3 && p2_b_box[p2_b_box.length-1] == 3)
                    screen = 5
                    count = 0
                elsif (p1_b_box.length == 8) && (p2_b_box.length == 8)
                    screen = 5
                    count = 0
                end
            end
        end
    end #if screen == 3の時のend 

    if screen == 5
        #時間関係のコード
        if count == 0
            start_time = Time.now
            count = 1
            # printf("screen = %d\n",screen)
        end
        end_time = Time.now
        processing_time = end_time - start_time

        if processing_time >= 0 && processing_time < 3
            #Game selection screenに "終了" を表示を行う
            Window.draw_font(220,190,"終了",Font.new(150)) 
        #processing_timeが3秒から5秒以内の時に、勝者と敗者を表示する
        elsif processing_time >= 3 && processing_time <= 10 
            # 中央線のを表示
                Window.draw_box_fill(339, 0, 341, 600, [255, 255, 255])
            #processing_timeが3秒から5秒以内の時に、Player1を表示する
                Window.draw_font(player_1_x - 50,player_1_y,"Player1",Font.new(80))
            #processing_timeが3秒から5秒以内の時に、Payer2を表示する
                Window.draw_font(player_2_x - 45,player_2_y,"Player2",Font.new(80))
            #processing_timeが3秒から5秒以内の時に、WINを表示する
            if  (p1_b_box[p1_b_box.length-1] == 3 && p2_b_box[p2_b_box.length-1] == 3) || (p1_b_box.length == 8) && (p2_b_box.length == 8)
                Window.draw_font(fir_bac_x[1] - 10,fir_bac_y,"even",Font.new(70)) 
                #processing_timeが3秒から5秒以内の時に、LOSEを表示する
                Window.draw_font(fir_bac_x[0] - 25,fir_bac_y,"even",Font.new(70))   
            elsif  p1_b_box[p1_b_box.length-1] == 3 
                Window.draw_font(fir_bac_x[0] - 25,fir_bac_y,"WIN",Font.new(70)) 
                #processing_timeが3秒から5秒以内の時に、LOSEを表示する
                Window.draw_font(fir_bac_x[1] - 25,fir_bac_y,"LOSE",Font.new(70))   
            elsif p2_b_box[p2_b_box.length-1] == 3
                Window.draw_font(fir_bac_x[1] - 25,fir_bac_y,"WIN",Font.new(70)) 
                #processing_timeが3秒から5秒以内の時に、LOSEを表示する
                Window.draw_font(fir_bac_x[0] - 25,fir_bac_y,"LOSE",Font.new(70))   
            end
            #processing_timeが5秒以上の時に、 リトライ スタート画面に戻る 止める の表示を行う               
        elsif processing_time >= 10
            break
        end
    end     #if screen == 5のとき
end #loop do のend
