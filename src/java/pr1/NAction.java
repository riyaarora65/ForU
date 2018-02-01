/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pr1;

/**
 *
 * @author Riya Arora
 */
public interface NAction {
    int UNBLOCK=1;
    int FOLLOW=2;
    int UNFOLLOW=3;
    int ANSWER=4;
    int FQUESANS=5;
    int COMMENT=6;
    int UPVOTE=7;
    int DOWNVOTE=8;
    int DLTUPVOTE=9;
    int DLTDOWNVOTE=10;
    int WRITTEN=1;
    int UPDATED=2;
    int VIEW100=11;
    int VIEW500=12;
    int VIEW1000=13;
    int VIEWMORE=14;
    int suggestedits=15;
}
